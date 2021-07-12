import 'dart:async';

import 'package:fazrisubmission/features/ui/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    pushPage(context);
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Center(child: Text("Planet Sneakers", style:
            TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,),))
          ],
        ),
      ),
    );
  }

  pushPage(BuildContext context)async{
    var duration = const Duration(seconds: 2);
    return new Timer(duration, (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomePage(0);
      }));
    });
  }
}


