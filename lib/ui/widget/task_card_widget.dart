import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/data/controller/list_controller.dart';
import 'package:task_management_app/data/model/data_model.dart';
import 'package:task_management_app/ui/widget/message_widget.dart';



class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({super.key, });
  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  String? _isSlected ;
  @override
  Widget build(BuildContext context) {
    ListController _listController = Provider.of<ListController>(
      context,
      listen: false,
    );
    return Consumer<ListController>(
      builder: (context, listController, child) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 5);
          },
          itemCount: listController.list.length,
          itemBuilder: (context, index) {
            final _data = DataModel.fromJson(listController.list[index]);
            return Dismissible(
              key: Key("helloKey"),
              direction: DismissDirection.endToStart,
              background: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.delete, color: Colors.red),
                ),
              ),
              onDismissed: (direction) {
                _listController.deleteData(index);
                showMessage(context, "Deleted Successfully");
              },
              child: Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        _data.categories ?? "",
                        //"categories",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(
                    _data.title ?? "",
                    //"Title",
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.green),
                  ),
                  subtitle: Text(
                    _data.dateTime ?? "",
                    // "Date",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.green),
                  ),
                  trailing: SizedBox(
                    width: 90, // Adjust width based on your content
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _data.expense ?? "",
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(color: Colors.red),
                        ),
                        // IconButton(
                        //   onPressed: alertBox,
                        //   icon: Icon(Icons.more_vert),
                        //   padding: EdgeInsets.zero, // Prevent extra space
                        //   constraints:
                        //       BoxConstraints(), // Prevent oversized button
                        // ),
                        PopupMenuButton<String>(
                          onSelected: (newStatus){
                            if(_data.status == "new"){
                              _listController.updateStatus(index, newStatus);
                              showMessage(context, "done");
                            }
                          },
                            itemBuilder: (context)=>[
                              PopupMenuItem(value: "Progress",child: Text("Move to Progress")),
                              PopupMenuItem(value: "Completed",child: Text("Move to Completed")),
                              PopupMenuItem(value: "Cancel",child: Text("Move to Cancel"))
                            ],
                        icon: Icon(Icons.more_vert),),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
  // alertBox(){
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text("Set the to complete"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextButton(onPressed: (){
  //
  //             }, child: Text("New")),
  //             TextButton(onPressed: (){
  //               Provider.of(context,listen: false).
  //             }, child: Text("Progress")),
  //             TextButton(onPressed: (){}, child: Text("Completed")),
  //             TextButton(onPressed: (){}, child: Text("Cancel")),
  //           ],
  //         ),
  //       );
  //     }
  //   );
  // }
}
