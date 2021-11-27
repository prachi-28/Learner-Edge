import 'package:flutter/material.dart';
import 'package:learner_edge/models/slot_data.dart';


class BookSlotPage extends StatefulWidget {
  final SlotData data;
  BookSlotPage({this.data});

  @override
  _BookSlotPageState createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),

        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              padding: EdgeInsets.all(12),
              child: Text('One step closer to meeting your prof!',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
              ),
              ),
            ),
            SizedBox(height: 40,),
            Text('${widget.data.name}',
            style: TextStyle(
              fontSize: 30,
            ),
            ),

            SizedBox(height: 7,),
            Text('${widget.data.email}',
              style: TextStyle(
                fontSize: 12,
              ),
            ),

            SizedBox(height: 30,),
            Text('Morning Slot (11-12 PM)',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
              ),
            ),

            SizedBox(height: 30,),


            // Padding(
            //   padding: EdgeInsets.all(20.0),
            //   child: _afternoonSlots.ReadAfternoonSlots()[0],
            // ),

            //:: TODO get slot details from firebase using the email id
            //:: TODO according to the number of slots, keep a counter to add buttons for slot

          ],
        ),
      ),
    );

  }
}


