




import 'package:flutter/material.dart';
import 'package:swasthya_smruti/login.dart';


class Mylogo extends StatefulWidget {
  const Mylogo({Key? key}) : super(key: key);


  @override
  State<Mylogo> createState() => _MylogoState();
}

class _MylogoState extends State<Mylogo> {

  @override
  void initState() {

    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 2),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyLogin()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(
          child: Container(

            padding: EdgeInsets.only(top: 50,left: 10,right: 10),






              child: Image.asset("assets/charak.jpg"),


          )

      ),


    );
  }
}

