import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learner_edge/services/auth.dart';
import 'package:learner_edge/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:learner_edge/models/user.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  String _contrastColour = "#189AB4"; // Blue Grotto
  String _darkColour = "#05445E"; // Navy Blue
  String _lightColour = "#75E6DA"; // Blue Green
  String _textColour = "#FFFFFF";
  String _appBarColour = "#191970";



  @override
  Widget build(BuildContext context) {
    myUser u=new myUser();
    return StreamProvider<myUser>.value(
      value: AuthService().user,
      initialData: u ,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: HexColor(_darkColour),
          // accentColor: HexColor(_lightColour),

          // backgroundColor: HexColor(_darkColour), //pale pink
          scaffoldBackgroundColor: HexColor(_darkColour),
          //dialogBackgroundColor: HexColor("#f3dee8"),
          // bottomNavigationBarTheme: BottomNavigationBarThemeData(
          //   backgroundColor: HexColor(_lightColour),
          //   selectedItemColor: HexColor(_contrastColour),
          //   unselectedItemColor: HexColor(_darkColour),
          // ),
          buttonTheme: ButtonThemeData(
            buttonColor: HexColor(_lightColour),
            // textTheme: ButtonTextTheme.accent,
          ),


          /*textTheme: TextTheme(
            button: TextStyle(
              color: HexColor(_darkColour),
            ),
            body1: TextStyle(
              color: HexColor(_lightColour),
            ),
            body2: TextStyle(
              color: HexColor(_lightColour),
            ),
            title: TextStyle(
              color: HexColor(_darkColour),
            ),
            subtitle: TextStyle(
              color: HexColor(_darkColour),
            )
          ),*/
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: HexColor(_textColour),
            displayColor: HexColor(_textColour),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: HexColor(_contrastColour),
            foregroundColor: HexColor(_lightColour),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: HexColor(_contrastColour),
              onPrimary: HexColor(_textColour),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: HexColor(_contrastColour), width: 1.5),

            ),
          ),
          // checkboxTheme: CheckboxThemeData(
          //   fillColor: MaterialStateProperty.all(HexColor(_contrastColour)),
          // ),
        ),
        home: Wrapper(),
      ),
    );
  }
}
