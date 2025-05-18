import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/apps.dart';
import 'package:task_management_app/data/controller/list_controller.dart';

void main() {
  runApp( MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>ListController()),
  ],
  child: MyApp(),));
}




