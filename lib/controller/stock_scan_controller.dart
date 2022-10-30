import 'package:fitpage_assignment/model/stock_scan_model.dart';
import 'package:fitpage_assignment/services/remote_services.dart';
import 'package:get/get.dart';

class StockScanController extends GetxController {
  var stockScanList = <StockScanModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getStockList();
    super.onInit();
  }

  /// Function to call remote services to populate
  /// observable list with stocks.
  void getStockList() async {
    var stockData = await RemoteServices().getStockData();
    if (stockData != null) {
      stockScanList.value = stockData;
    }
    isLoading.value = false;
  }
}
