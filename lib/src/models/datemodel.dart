// To parse this JSON data, do
//
//     final dateModel = dateModelFromJson(jsonString);

import 'dart:convert';

DateModel dateModelFromJson(String str) => DateModel.fromJson(json.decode(str));

String dateModelToJson(DateModel data) => json.encode(data.toJson());

class DateModel {
  bool? success;
  dynamic data;
  DateModel({
    this.success,
    this.data,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
    success: json["success"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
  };
}
