// import 'package:flutter/material.dart';
//
// class ProgressTaskScreen extends StatefulWidget {
//   const ProgressTaskScreen({super.key});
//
//   @override
//   State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
// }
//
// class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text("Progress Task Screen"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/data/controller/list_controller.dart';
import 'package:task_management_app/data/model/data_model.dart';

class ProgressTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Tasks"), backgroundColor: Colors.green),
      body: Consumer<ListController>(
        builder: (context, listController, child) {
          // Filter tasks with status "Completed"
          List<Map<String, dynamic>> completedTasks =
          listController.list.where((task) => task["status"] == "Progress").toList();

          return ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              final _data = DataModel.fromJson(completedTasks[index]);
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: FittedBox(
                      child: Text(_data.categories ?? "", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  title: Text(_data.title ?? "", style: TextStyle(color: Colors.green)),
                  subtitle: Text(_data.dateTime ?? "", style: TextStyle(color: Colors.black)),
                  trailing: Text(_data.expense ?? "", style: TextStyle(color: Colors.red)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
