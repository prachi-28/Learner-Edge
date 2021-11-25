import 'package:day_picker/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learner_edge/home/student_home.dart';
import 'package:learner_edge/home/teacher_home.dart';
import 'package:learner_edge/services/auth.dart';
import 'package:learner_edge/services/create_student.dart';
import 'package:learner_edge/services/create_teacher.dart';
import 'package:day_picker/model/day_in_week.dart';


class Register extends StatefulWidget {
  static final String path = "lib/src/pages/login/auth3.dart";
  final Function toggleView;
  Register({this.toggleView});

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  //final String backImg = room4;
  bool formVisible;
  int _formsIndex;


  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     //image: AssetImage(room4),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Stack(
            children: <Widget>[
              Container(

                child: Column(
                  children: <Widget>[
                    const SizedBox(height: kToolbarHeight + 40),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          // Text(
                          //   'Welcome',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 30.0,
                          //
                          //   ),
                          // ),


                          const SizedBox(height: 10.0),
                          // Text(
                          //   "Welcome to this awesome login app. \n You are awesome",
                          //   style: TextStyle(
                          //     color: Colors.white70,
                          //     fontSize: 18.0,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10.0),

                        const SizedBox(width: 10.0),

                        const SizedBox(width: 10.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                   ],
                ),
              ),
              const SizedBox(height: 30.0),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: (formVisible)
                    ? null
                    : Container(

                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            textColor: _formsIndex == 1
                                ? HexColor("#ffffff")
                                : Colors.black,
                            color:
                            _formsIndex == 1 ? HexColor("#189AB4") : Colors.white,
                            child: Text("Teacher"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                              setState(() {
                                _formsIndex = 1;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          RaisedButton(
                            textColor: _formsIndex == 2
                                ? Colors.white
                                : Colors.black,
                            color:
                            _formsIndex == 2 ? HexColor("#189AB4") : Colors.white,
                            child: Text("Student"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            onPressed: () {
                              setState(() {
                                _formsIndex = 2;
                              });
                            },
                          ),
                          const SizedBox(width: 10.0),
                          ElevatedButton(

                            onPressed: () {
                              widget.toggleView();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#363333"),
                              elevation: 0,

                            ),

                            child: Text(
                              'Back!',
                              style: TextStyle(
                                color: HexColor("#ffffff"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),

                        ],
                      ),
                      Container(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child:
                          _formsIndex == 1 ? TeacherForm() : StudentForm(),
                        ),

                      )
                    ],

                  ),

                ),
              )
            ],
          ),
        ));
  }
}

class TeacherForm extends StatefulWidget {
  const TeacherForm({
    Key key,
  }) : super(key: key);

  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final CreateTeacherService _newTeacher = CreateTeacherService();
  String name="";
  String email="";
  String password="";
  //String slots="";
  //String qualification="";
  String error="";
  List<String> afternoonSlots=[];
  List<String> morningSlots=[];

  List<DayInWeek> _days = [
    DayInWeek(
      "Sun",
    ),
    DayInWeek(
      "Mon",
    ),
    DayInWeek(
      "Tue",
    ),
    DayInWeek(
      "Wed",
    ),
    DayInWeek(
      "Thu",
    ),
    DayInWeek(
      "Fri",
    ),
    DayInWeek(
        "Sat",
        isSelected: true
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',

                ),
                validator: (val) => val.isEmpty ? 'Enter Full Name': null,
                onChanged: (val) {
                  setState(() {
                    name=val;
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Qualification',
            //
            //     ),
            //     validator: (val) => val.isEmpty ? 'Enter qualification': null,
            //     onChanged: (val) {
            //       setState(() {
            //         qualification=val;
            //       });
            //
            //     },
            //   ),
            // ),
            // SizedBox(height: 20,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Free Slots',
            //
            //     ),
            //     validator: (val) => val.isEmpty ? 'Enter free slots': null,
            //     onChanged: (val) {
            //       setState(() {
            //         slots=val;
            //       });
            //
            //     },
            //   ),
            // ),
            Text(
              "Afternoon slots (2-5PM)"
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectWeekDays(
                fontSize:14,
                fontWeight: FontWeight.w500,
                days: _days,
                border: false,
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                //backgroundColor: Color(0xffffff),
                onSelect: (values) {
                  print(values);
                  //print(values.runtimeType);
                  afternoonSlots=values;
                },
              ),
            ),

            SizedBox(height: 20,),
            Text(
                "Morning slots (9-12PM)"
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectWeekDays(
                fontSize:14,
                fontWeight: FontWeight.w500,
                days: _days,
                border: false,
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                //backgroundColor: Color(0xffffff),
                onSelect: (values) {
                  print(values);
                  morningSlots=values;
                },
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',

                ),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val) {
                  setState(() {
                    email=val;
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  //hintText: 'Enter a valid email id',
                ),
                validator: (val) => val.length<6 ? 'Enter more than 6 chars': null,
                obscureText: true,
                onChanged: (val) {

                  setState(() {
                    password=val;
                  });
                },
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //primary: Colors.pink,
                ),
                //color: Colors.blueGrey,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {

                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth. registerWithEmailAndPassword(email,password);
                    if(result==null){
                      setState(() {
                        error="Please supply a valid email";
                      });
                    }
                    else {
                      _newTeacher.addTeacher(email, name, afternoonSlots, morningSlots);

                    }


                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}

class StudentForm extends StatefulWidget {
  const StudentForm({
    Key key,
  }) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final CreateStudentService _newStudent = CreateStudentService();
  String name="";
  String email="";
  String password="";
  String error="";
  String course="";


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',

                ),
                validator: (val) => val.isEmpty ? 'Enter Full Name': null,
                onChanged: (val) {
                  setState(() {
                    name=val;
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Course',

                ),
                validator: (val) => val.isEmpty ? 'Enter course': null,
                onChanged: (val) {
                  setState(() {
                    course=val;
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',

                ),
                validator: (val) => val.isEmpty ? 'Enter an email': null,
                onChanged: (val) {
                  setState(() {
                    email=val;
                  });

                },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  //hintText: 'Enter a valid email id',
                ),
                validator: (val) => val.length<6 ? 'Enter more than 6 chars': null,
                obscureText: true,
                onChanged: (val) {

                  setState(() {
                    password=val;
                  });
                },
              ),
            ),

            SizedBox(height: 20,),

            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //primary: Colors.pink,
                ),
                //color: Colors.blueGrey,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {

                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth. registerWithEmailAndPassword(email,password);
                    if(result==null){
                      setState(() {
                        error="Please supply a valid email";
                      });
                    }
                    else {
                      _newStudent.addStudent(email, name, course);

                    }

                  }
                },
              ),
            ),
            SizedBox(height: 20,),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
            SizedBox(height: 60,),

          ],
        ),
      ),

    );
  }
}



