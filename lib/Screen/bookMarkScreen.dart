import 'package:flutter/material.dart';
import 'package:newappflutter/Services/realTime_db.dart';

class bookMarkScreen extends StatefulWidget {
  const bookMarkScreen({Key? key}) : super(key: key);


  @override
  State<bookMarkScreen> createState() => _bookMarkScreenState();
}

class _bookMarkScreenState extends State<bookMarkScreen> {

  realTimeDataBase dataBase = new realTimeDataBase();
  late List<Map> maps;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async{
    await dataBase.readDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
