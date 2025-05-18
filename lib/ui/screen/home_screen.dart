import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/data/controller/list_controller.dart';
import 'package:task_management_app/ui/screen/cancel_task_screen.dart';
import 'package:task_management_app/ui/screen/completed_task_screen.dart';
import 'package:task_management_app/ui/screen/new_task_screen.dart';
import 'package:task_management_app/ui/screen/progress_task_screen.dart';
import 'package:task_management_app/ui/widget/message_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategories ;
  // List<DropdownMenuItem<String>> _dropDownMenuItem() {
  //   return [
  //     DropdownMenuItem(
  //       child: Row(children: [Icon(Icons.food_bank), Text("Food")]),
  //     ),
  //     DropdownMenuItem(
  //       child: Row(children: [Icon(Icons.car_rental), Text("Travel")]),
  //     ),
  //     DropdownMenuItem(child: Row(children: [Icon(Icons.book), Text("Study")])),
  //     DropdownMenuItem(
  //       child: Row(children: [Icon(Icons.shop), Text("Shopping")]),
  //     ),
  //   ];
  // }
  List<DropdownMenuItem<String>> _dropDownMenuItem
    = [
      DropdownMenuItem(
        value: "Food",
        child: Row(children: [Icon(Icons.food_bank), Text("Food")]),
      ),
      DropdownMenuItem(value: "Travel",
        child: Row(children: [Icon(Icons.car_rental), Text("Travel")]),
      ),
      DropdownMenuItem(value: "Study",child: Row(children: [Icon(Icons.book), Text("Study")])),
      DropdownMenuItem(value: "Shopping",
        child: Row(children: [Icon(Icons.shop), Text("Shopping")]),
      ),
    ];


  int _selectedWidget = 0;
  List<Widget> _listWidget = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
  ];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  ListController _listController = ListController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(child: Text("Task Management App Offline")),
        backgroundColor: Colors.green,
      ),
      body: _listWidget[_selectedWidget],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green,
        selectedIndex: _selectedWidget,
        onDestinationSelected: (value) {
          setState(() {
            _selectedWidget = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.new_label_outlined),
            label: "New",
          ),
          NavigationDestination(
            icon: Icon(Icons.downloading),
            label: "Progress",
          ),
          NavigationDestination(icon: Icon(Icons.done_all), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.delete), label: "Cancel"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        focusColor: Colors.black,
        foregroundColor: Colors.white,
        highlightElevation: 5,
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {



    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: "Enter the title"),
                ),
                TextFormField(
                  controller: _expenseController,
                  decoration: InputDecoration(labelText: "Enter the expense"),
                ),
                // TextFormField(
                //   controller: _dateController,
                //   decoration: InputDecoration(labelText: "Enter the date"),
                // ),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Selected Categories"),
                    items: _dropDownMenuItem,
                    // _dropDownMenuItem.map((value){
                    //   return DropdownMenuItem(value: value,child: value,);
                    // }).toList(),
                    onChanged: ( value) {

                      _selectedCategories = value;

                      _categoriesController.text = value ?? "";
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _submitButton();
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _submitButton() async{
    if(_formKey.currentState!.validate()){

        Provider.of<ListController>(context,listen: false).addData(
            _titleController.text,
            _categoriesController.text,
            _dateController.text = DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
            _expenseController.text,
          "new"

        );
        Navigator.pop(context);
      print("added Successfully");
      print(_listController.list);
      showMessage(context, "Successfully Added");

    }
  }
}
