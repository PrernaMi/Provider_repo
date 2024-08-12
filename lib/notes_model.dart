class NotesModel{
  String title;
  String desc;

  NotesModel({
    required this.title,
    required this.desc
});

  factory NotesModel.fromMap(Map<String,dynamic>map){
    return NotesModel(title: map['title'], desc: map['desc']);
  }

  Map<String,dynamic> toMap(){
    return {
      'title' : title,
      'desc' : desc,
    };
  }
}