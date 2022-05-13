import 'package:firebase_auth/firebase_auth.dart';
import 'package:newappflutter/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authenticate/Authentication.dart';


class WrapperScreen extends StatefulWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return user!=null? MyHome():Authenticate();
  }
}
