import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/list_provider.dart';
import 'package:state_management_provider/notes_model.dart';
import 'package:state_management_provider/provider_page.dart';

class DataFilled extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Your data")),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          TextField(
            controller: descController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<ListProvider>().setList(
                    NotesModel(
                        title: titleController.text.toString(),
                        desc: descController.text.toString()));
                Navigator.pop(context);
              },
              child: Text("Tab"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProviderPage>().setData();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
