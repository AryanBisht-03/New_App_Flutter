import 'package:firebase_database/firebase_database.dart';

class realTimeDataBase{
  late DatabaseReference _dbref;
  List<dynamic> news = [];

  realTimeDataBase(){
    _dbref = FirebaseDatabase.instance.reference();
  }


  Future<List?> readDatabase() async {
    List<dynamic> videos = [];
    _dbref.child("BookMarks").once().then((DatabaseEvent event){
      DataSnapshot snapshot = event.snapshot;
      for(DataSnapshot datasnap in snapshot.children)
      {
        videos.add(datasnap.value);
      }
      news=videos;
    });
    return news;
  }

  void writeData(Map map){
    Map<String,String> values = {
      "author": map["author"],
      "title": map["title"],
      "description": map["description"],
      "url": map["url"],
      "urlToImage": map["urlToImage"],
      "content": map["content"],
    };
    _dbref.child("BookMarks").push().update(values);
  }
}

