import 'dart:convert';

List<StockScanModel> stockScanModelFromJson(String str) =>
    List<StockScanModel>.from(
        json.decode(str).map((x) => StockScanModel.fromJson(x)));

// Scanned Stock Model.
class StockScanModel {
  StockScanModel({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  int? id;
  String? name;
  String? tag;
  String? color;
  List<Criterion>? criteria;

  factory StockScanModel.fromJson(Map<String, dynamic>? json) => StockScanModel(
        id: json?["id"],
        name: json?["name"],
        tag: json?["tag"],
        color: json?["color"],
        criteria: List<Criterion>.from(
            json?["criteria"].map((x) => Criterion.fromJson(x))),
      );
}

class Criterion {
  Criterion({
    this.type,
    this.text,
    this.variable,
  });

  String? type;
  String? text;
  Variable? variable;

  factory Criterion.fromJson(Map<String, dynamic>? json) => Criterion(
        type: json?["type"],
        text: json?["text"],
        variable: Variable.fromJson(json?["variable"]),
      );
}

class Variable {
  Variable({
    this.type1,
    this.type2,
    this.type3,
    this.type4,
  });

  VarType? type1;
  VarType? type2;
  VarType? type3;
  VarType? type4;

  factory Variable.fromJson(Map<String, dynamic>? json) => Variable(
        type1: VarType.fromJson(json?["\$1"]),
        type2: VarType.fromJson(json?["\$2"]),
        type3: VarType.fromJson(json?["\$3"]),
        type4: VarType.fromJson(json?["\$4"]),
      );
}

class VarType {
  VarType({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  String? type;
  List<dynamic>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  factory VarType.fromJson(Map<String, dynamic>? json) => VarType(
        type: json?["type"],
        values: json?["values"] == null
            ? null
            : List<dynamic>.from(json?["values"].map((x) => x)),
        studyType: json?["study_type"],
        parameterName: json?["parameter_name"],
        minValue: json?["min_value"],
        maxValue: json?["max_value"],
        defaultValue: json?["default_value"],
      );
}
