import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_app/data/model/data_model.dart';
import 'package:task_management_app/ui/widget/message_widget.dart';

class ListController extends ChangeNotifier{
  static final ListController _instance = ListController._internal();
  List<Map<String, dynamic>> list = [];
  factory ListController(){
    return _instance;
  }
  ListController._internal();

  void addData(
    String title,
    String categories,
    String dateTime,
    String expense,
      String status,
  ) {
    list.add(
      DataModel(
        title: title,
        categories: categories,
        dateTime: dateTime,
        expense: expense,
        status: status
      ).toJson(),
    );
    notifyListeners();
  }
  void deleteData(int index){
    list.removeAt(index);
    notifyListeners();
  }
  void updateStatus(int index, String newStatus){
    list[index]["status"]= newStatus;
    notifyListeners();

  }
  void getCompletedData(int index, String status){
    if(list[index]["status"]== "progress"){
      notifyListeners();
    }
    notifyListeners();
  }

}
