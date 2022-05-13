import 'package:newappflutter/Screen/showFullNewScreen.dart';
import 'package:newappflutter/Services/authService.dart';
import 'package:flutter/material.dart';
import '../Services/newsModel.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() =>  _MyHomeState();
}


class _MyHomeState extends State<MyHome> {

  bool bookmark = true;
  String bookTitle = "Book-Mark News";
  List<dynamic> _list= [];
  News obj = new News();
  @override
  void initState() {
    super.initState();
    bookmark? getAllNews(): getbookmarkNew();
  }

  void getbookmarkNew() async{
    List<dynamic> tmp = (await obj.getbookmark())!;
    setState(() {
      _list = tmp;
    });
  }
  void getAllNews() async{
    List<dynamic> tmp = (await obj.getData())!;
    setState(() {
      _list = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    bookmark? getAllNews(): getbookmarkNew();

    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text("News App"),
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async{
            await _auth.signOut();
          }, icon: Icon(Icons.person),
              label: Text("Logout")),
          FlatButton.icon(onPressed: (){
            setState(() {
              bookTitle = bookmark? "Show all News" :"BookMark News";
              bookmark = !bookmark;
            });
          },
              label: Text(bookTitle),
              icon: Icon(Icons.bookmark))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => fullNewsScreen(map: _list[index],),
                 ));
                },
                child: newsListWidget(map: _list[index]));
            },
          itemCount: _list.length,
          ),
        ),
      );
  }
}

class newsListWidget extends StatefulWidget {

  Map map;
  newsListWidget({required this.map});
  @override
  State<newsListWidget> createState() => _newsListWidgetState();
}

class _newsListWidgetState extends State<newsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(widget.map["urlToImage"],
          height: 80,
          width: 80,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Auther :- ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  Text(widget.map["author"])
                ],
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description :- ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 250,
                      child: Text(widget.map["description"]))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}




