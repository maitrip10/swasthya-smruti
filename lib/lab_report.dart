

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class lab_report extends StatefulWidget {
  const lab_report({Key? key}) : super(key :key);

  @override
  State<lab_report> createState() => lab_reportState();
}

class lab_reportState extends State<lab_report> {

  TextEditingController report_id= new TextEditingController();
  TextEditingController mh_id= new TextEditingController();
  TextEditingController report_name= new TextEditingController();
  TextEditingController result= new TextEditingController();
  TextEditingController comment= new TextEditingController();
  TextEditingController lab_license= new TextEditingController();
  TextEditingController lab_name= new TextEditingController();








  Future lab_report()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/lab_report.php";
    //json maping user entered details

    Map mapeddate = {
      'report_id': report_id.text,
      'mh_id': mh_id.text,
      'report_name': report_name.text,
      'result': result.text,
      'comment' : comment.text,
      'lab_license' : lab_license.text,
      'lab_name' : lab_name.text
    };
    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here

    var data = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_img.jpg'),fit:BoxFit.cover)),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Center(child: Text("ADD LAB REPORT"),),),
        body: Stack(

          children: [
            Container(
              padding: EdgeInsets.only(left: 85, top: 98),

            ),
            SingleChildScrollView(
              child: Container(



                padding: EdgeInsets.only(top: 80,right: 35,left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: report_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'REPORT ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: mh_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'MH ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: report_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'REPORT NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: result,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'RESULT',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: comment,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'COMMENT',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: lab_license,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'LAB LICENSE NO',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(controller: lab_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'LAB NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),






                    ElevatedButton(onPressed: () {
                      lab_report();
                    }, child:Text('SAVE'),


                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(80.0, 60.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),)

                  ],
                ),
              ),

            )

          ],
        ),

      ),
    );
  }

}