// if user is logged in, show the home page
// else show login page

import 'package:flutter/material.dart';
import 'package:learner_edge/authentication/authenticate.dart';
import 'package:learner_edge/home/home.dart';
import 'package:learner_edge/models/user.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<myUser>(context);
    //print(user);

    if(user==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
