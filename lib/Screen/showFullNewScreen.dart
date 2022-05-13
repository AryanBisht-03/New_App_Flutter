import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:newappflutter/Services/realTime_db.dart';

class fullNewsScreen extends StatefulWidget {
  Map map;
  fullNewsScreen({Key? key,required this.map}) : super(key: key);

  @override
  State<fullNewsScreen> createState() => _fullNewsScreenState();
}

class _fullNewsScreenState extends State<fullNewsScreen> {

  realTimeDataBase dataBase = new realTimeDataBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsApp",),
        actions: [
          FlatButton.icon(onPressed: (){
            dataBase.writeData(widget.map);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("News is bookmarked"),
            ));
          },
              icon: Icon(Icons.book,
              color: Colors.orange,),
              label: Text("BookMark",
              style: TextStyle(
                color: Colors.orangeAccent
              ),
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 500,
                    child: Text(widget.map["title"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange[500],
                      fontWeight: FontWeight.bold
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Image.network(widget.map["urlToImage"]),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Auther :- ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                Text(widget.map["author"])
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description :- ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(width: 500,
                    child: Text(widget.map["description"]))
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Content :- ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 18,
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(width: 500,
                    child: Text(widget.map["content"]))
              ],
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Link for full news :- ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8,),
                SizedBox(width: 500,
                  child: new RichText(text: new TextSpan(
                    children: [
                          new TextSpan(
                            text: 'Click here',
                            style: new TextStyle(color: Colors.blue),
                            recognizer: new TapGestureRecognizer()..onTap = () async {
                              print("link clicked");
                              String url = widget.map["url"];
                              // bool cond = await canLaunchUrl(Uri.parse(url));
                              // if (cond) {
                                    await launchUrl(Uri.parse(url),
                                      mode: LaunchMode.inAppWebView,);
                                // } else {
                                // throw 'Could not launch $url';
                                // }
                              },
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
