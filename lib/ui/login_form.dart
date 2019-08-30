import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";


 void _erase(){
   setState(() {
     _userController.clear();
     _passwordController.clear();
   });
 }
  void _welcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _welcomeString= _userController.text;
      }
      else{
        _welcomeString = "Nothin!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Theme.of(context).backgroundColor,
            ),
            new Container(
              height: 180.0,
              width: 480.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                          hintText: "Password", icon: new Icon(Icons.lock)),
                  obscureText: true),
                  new Padding(padding: new EdgeInsets.all(15)),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left:38.0),
                          child: new RaisedButton(
                            color: Theme.of(context).backgroundColor,
                            onPressed: _welcome,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                  fontSize: 26.0, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left:200.0),

                          child: RaisedButton(
                            color: Colors.redAccent,
                              onPressed: _erase,
                              child: new Text(
                                "Clear",
                                style: new TextStyle(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w500),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(15)),

            new Center(
              child: new Text('welcome, $_welcomeString',
              style: new TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 34,
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
