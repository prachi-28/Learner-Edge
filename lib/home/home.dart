// page shown after log in
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/services/auth.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Home_Stateful();
  }
}

class Home_Stateful extends StatefulWidget {
  @override
  _Home_StatefulState createState() => _Home_StatefulState();
}

class _Home_StatefulState extends State<Home_Stateful> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,

      appBar: AppBar(
        //;backgroundColor: Colors.blueGrey,
        elevation: 0.0,
        title: Text('Welcome'),


      ),
      body: FlatButton(
        onPressed: () {
          _auth.signOut();
        },
        // padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          'Logout',
          style: TextStyle(
            color: HexColor("#e16428"),
          ),
        ),
      ),



    );
  }


}
