import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/list_provider.dart';
import 'package:state_management_provider/notes_model.dart';

class UpdateList extends StatelessWidget{
  int index;
  UpdateList({required this.index});
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update your list"),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
          ),
          TextField(
            controller: descController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: (){
            context.read<ListProvider>().editList(index: index, newNote: NotesModel(title: titleController.text.toString(), desc: descController.text.toString()));
            Navigator.pop(context);
          }, child: Text("Tab"))
        ],
      ),
    );
  }
}