import 'package:flutter/material.dart';
import 'package:task_management_app/ui/widget/task_card_widget.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TaskCardWidget(),
    );
  }
}
