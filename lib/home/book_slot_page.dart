import 'package:flutter/material.dart';
import 'package:learner_edge/models/slot_data.dart';
import 'package:learner_edge/services/read_slots.dart';


class BookSlotPage extends StatefulWidget {
  final SlotData data;
  BookSlotPage({this.data});

  @override
  _BookSlotPageState createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {
  ReadSlotsClass _getslots = ReadSlotsClass();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),

        child: Column(
          children: [

            SizedBox(height: 20,),
            Text('${widget.data.name}',
            style: TextStyle(
              fontSize: 30,
            ),
            ),

            // SizedBox(height: 7,),
            // Text('${widget.data.email}',
            //   style: TextStyle(
            //     fontSize: 12,
            //   ),
            // ),

            SizedBox(height: 20,),
            Text('Morning Slot (11-12 PM)',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: _getslots.readMorningSlots(widget.data.email),
            ),


            Text('Afternoon Slot (12-1 PM)',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
              ),
            ),


            Padding(
              padding: EdgeInsets.all(5.0),
              child: _getslots.readAfternoonSlots(widget.data.email),
            ),


          ],
        ),
      ),
    ));

  }
}


