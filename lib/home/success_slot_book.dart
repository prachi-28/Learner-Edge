import 'package:flutter/material.dart';
import 'package:learner_edge/models/call_data.dart';
import 'package:learner_edge/services/read_slots.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessSlotBook extends StatefulWidget {
  final CallData data;
  SuccessSlotBook({this.data});
  @override
  _SuccessSlotBookState createState() => _SuccessSlotBookState();
}

class _SuccessSlotBookState extends State<SuccessSlotBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 100.0),
              child: Center(
                child: Container(
                  width: 500,
                  height: 200,
                  child: SvgPicture.asset(
                    "images/success.svg",
                  ),
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 80),
              child: Text('Meeting is confirmed for',
              style: TextStyle(
                fontSize: 25
              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('${widget.data.teacherEmail} and ${widget.data.studentEmail}'),
            ),
          ],
        ),
      ),
    );
  }
}
