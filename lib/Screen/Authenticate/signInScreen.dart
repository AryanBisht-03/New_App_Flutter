import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newappflutter/Services/authService.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String error = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email="",password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        title: Text("Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2)
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.white,width: 2)
                  // )
                ),
                validator: (val) => val!.isEmpty ? "Enter an email" : null,
                onChanged: (val){
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                ),
                validator: (val) => val!.length < 6 ? "Enter the password 6+ chars long" : null,
                onChanged: (val){
                  setState(() => password = val);
                },
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(onPressed: () async {
                if(_formKey.currentState!.validate())
                {
                  dynamic result = await _auth.signInWithEmail(email, password);
                  if(result == null){
                    print("Here");
                    setState(() {
                      error = "ENTERED CREDENTIALS ARE WRONG";
                    });
                  }
                }
              },
                color: Colors.orange[800],
                child: Text("Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Text(error,
              style: TextStyle(
                color: Colors.red[800],
                fontSize: 21,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
