import 'package:flutter/material.dart';
import 'package:state_management_provider/notes_model.dart';

class ListProvider extends ChangeNotifier{
  List<Map<String,dynamic>> _allNotes = [];

  void setList(NotesModel map){
    _allNotes.add(map.toMap());
    notifyListeners();
  }

  List<Map<String,dynamic>> getList(){
    return _allNotes;
  }

  void editList({required int index,required NotesModel newNote}){
    _allNotes[index] = newNote.toMap();
    notifyListeners();
  }

  void delete(int index){
    _allNotes.removeAt(index);
    notifyListeners();
  }
}