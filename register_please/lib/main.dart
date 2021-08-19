import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(backgroundColor: Colors.white, body: UserForm()),
    ),
  );
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  var _name = '';
  var _age = '';
  var _phone = '';

  final nameCon = new TextEditingController();
  final ageCon = new TextEditingController();
  final phoneCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 25.0, top: 0.0, right: 25.0, bottom: 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 43.0),
      child: Center(
        child: SafeArea(
          //this widget is a SAVIOUR from all sorts of overflow errors. Use it!
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 0.0, top: 35.0, right: 0.0, bottom: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: kHeaderStyle,
                      ),
                      Text('Sign Up', style: kHeaderStyle),
                      Text(
                        'To Get Started',
                        style: kHeaderStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: TextField(
                    //controller is like the id for the TextWidget, it will help us extract the user input sing .text. Check the setState
                    //below
                    controller: nameCon,  
                    decoration: InputDecoration(
                        hintText: 'Name', hintStyle: kFormStyle),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ageCon,
                  decoration:
                      InputDecoration(hintText: 'Age', hintStyle: kFormStyle),
                )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: phoneCon,
                  decoration: InputDecoration(
                      hintText: 'Phone Number', hintStyle: kFormStyle),
                )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                    color: kAccentColor,
                    onPressed: () {
                      setState(() {
                        //extract the user input and store it in the variables
                        _name = nameCon.text;
                        _age = ageCon.text;
                        _phone = phoneCon.text;
                      });
                      nameCon.clear();
                      ageCon.clear();
                      phoneCon.clear();
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //Display user input on the sceen
                Text(
                  'NAME: ${_name}',
                  style: kResultStyle,
                ),
                Text(
                  'AGE: ${_age}',
                  style: kResultStyle,
                ),
                Text(
                  'PHONE NUMBER: ${_phone}',
                  style: kResultStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
