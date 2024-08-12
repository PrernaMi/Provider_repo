import 'package:flutter/cupertino.dart';

class ProviderPage extends ChangeNotifier{
  int _count = 0;
   String _title = 'title';
   String _desc = 'desc';

   List<Map<String,dynamic>>_mList =[];

  //increment the count
  void setData(){
    _count++;
    notifyListeners();
  }

  void setInList(String name,String pass){
    _mList.add({
      _title : name,
      _desc : pass
    });
    notifyListeners();
  }

  List<Map<String,dynamic>>getList(){
    return _mList;
  }

  int getData(){
    return _count;
  }
}