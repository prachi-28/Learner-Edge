import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learner_edge/models/call_data.dart';
import 'package:learner_edge/services/confirm_slot.dart';
import 'package:learner_edge/services/delete_slot.dart';
import 'package:learner_edge/services/read_slots.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SuccessSlotBook extends StatefulWidget {
  final CallData data;
  SuccessSlotBook({this.data});
  @override
  _SuccessSlotBookState createState() => _SuccessSlotBookState();
}

class _SuccessSlotBookState extends State<SuccessSlotBook> {
  ConfirmSlot _slot=ConfirmSlot();
  DeleteSlot _delSlot=DeleteSlot();
  final resetText = TextEditingController();
  void clearText() {
    resetText.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
        child: Column(
          children: [
            SizedBox(height: 65,),
            Center(
              child: ElevatedButton(
                child: Text(
                  'Confirm Slot',
                ),
                onPressed: () async {
                    _slot.AddSlotStudent(widget.data.teacherEmail, widget.data.day, widget.data.slot);
                   _delSlot.DeleteSlotStudent(widget.data.teacherEmail, widget.data.slot, widget.data.day);
                    clearText();
                    Fluttertoast.showToast(
                        msg: "Slot confirmed. Meeting link will be sent soon!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black12,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                },


              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 80),
              child: Text('On ${widget.data.day}',

              style: TextStyle(
                fontSize: 35,
                color: HexColor('#189AB4')

              ),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Attendees:'),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('${widget.data.teacherEmail}',
             ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text('${widget.data.studentEmail}'),
            ),
          ],
        ),
      ),
    );
  }
}
