import 'package:http/http.dart';
import 'dart:convert';
import 'package:newappflutter/Services/realTime_db.dart';

class News{
  late List<dynamic> news;
  realTimeDataBase dataBase = new realTimeDataBase();

  Future<List?> getData() async {
    try{
      String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=285b76b8642543bfa77078e2b3e435b5";
      Response response = await get(Uri.parse(url));
      Map data = jsonDecode(response.body);

      news = data['articles'];
      return news;
    }
    catch(e)
    {
      print("Error $e");
      return null;
    }
  }

  Future<List?> getbookmark() async{
    return dataBase.readDatabase();
  }
}