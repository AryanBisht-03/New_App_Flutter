import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newappflutter/Services/authService.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
        title: Text("Register in Brew Crew"),actions: <Widget>[
        FlatButton.icon(onPressed: (){
          widget.toggleView();
        },
            icon: Icon(Icons.person),
            label: Text("Sign In"))
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
                validator: (val) => val!.isEmpty ? "Enter an email" : null,
                onChanged: (val){
                  setState(() => email = val);
                },
                decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white,width: 2)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (val){
                  setState(() => password = val);
                },
                obscureText: true,decoration: InputDecoration(
                hintText: "Password",
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 2)
                ),
              ),
                validator: (val) => val!.length < 6 ? "Enter the password 6+ chars long" : null,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(onPressed: () async {
                if(_formKey.currentState!.validate())
                {
                  dynamic result = await _auth.registerwithEmail(email, password);
                  print("Logging in");
                  if(result == null){
                    setState(() {
                      error = "There is some error while registering ";
                    });
                  }
                }
              },
                color: Colors.orange[800],
                child: Text("Register",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 21.0,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
