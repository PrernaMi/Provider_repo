import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/data_filled.dart';
import 'package:state_management_provider/list_provider.dart';
import 'package:state_management_provider/notes_model.dart';
import 'package:state_management_provider/provider_page.dart';
import 'package:state_management_provider/update_list_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Home Page")),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //fetching count value
            Consumer<ProviderPage>(builder: (_,provider,__){
              return Text('${provider.getData()}',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
            }),
            //fetching list
            Consumer<ListProvider>(builder: (_,provider,__){
              List<NotesModel>allNotes = [];

              var data = context.watch<ListProvider>().getList();

              for(Map<String,dynamic> eachModel in data){
                allNotes.add(NotesModel.fromMap(eachModel));
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: allNotes.length,
                    itemBuilder: (_,Index){
                      return ListTile(
                        title: Text(allNotes[Index].title),
                        subtitle: Text(allNotes[Index].desc),
                        trailing: SizedBox(
                          width: 60,
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return UpdateList(index: Index);
                                    }));
                                    print("hello");
                                  },
                                  child: Icon(Icons.edit)),
                              InkWell(
                                  onTap: (){
                                    context.read<ListProvider>().delete(Index);
                                  },
                                  child: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DataFilled();
              }));
            }, child: Text("Tab"))
          ],
        ),
      )
    );
  }
}