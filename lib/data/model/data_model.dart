import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DataModel{
  String? title;
  String? categories;
  String? dateTime;
  String? expense;
  String? status;

  DataModel({
    required this.title,
    required this.categories,
    required this.dateTime,
    this.expense,
    required this.status,
});

  factory DataModel.fromJson(Map<String,dynamic>jsonData){
    return DataModel(
        title: jsonData["title"],
        categories: jsonData["categories"],
        dateTime: DateFormat("yyyy-MM-dd HH:mm").format(DateTime.parse(jsonData["dateTime"])),
      expense: jsonData["expense"],
      status: "new"
    );
  }
  Map<String,dynamic> toJson(){
    return {
      "title":title,
      "categories": categories,
      "dateTime": dateTime,
      "expense": expense,
    };
  }

}