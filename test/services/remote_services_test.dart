import 'package:fitpage_assignment/services/remote_services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Stock scan list fetched',
    () async {
      bool isFetched = false;
      var fetchList = await RemoteServices().getStockData();
      if (fetchList != null) {
        isFetched = true;
      }
      expect(isFetched, true);
    },
  );
}
