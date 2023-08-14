

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class add_dagnosis extends StatefulWidget {
  const add_dagnosis({Key? key}) : super(key :key);

  @override
  State<add_dagnosis> createState() => add_dagnosisState();
}

class add_dagnosisState extends State<add_dagnosis> {

  TextEditingController mh_id= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController uhid= new TextEditingController();
  TextEditingController diagnosis= new TextEditingController();

  Future add_diagnosis()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/medical_history.php";
    //json maping user entered details

    Map mapeddate = {
      'mh_id': mh_id.text,
      'doctor_id': doctor_id.text,
      'uhid': uhid.text,
      'diagnosis': diagnosis.text,

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
        appBar: AppBar(title: Center(child: Text("ADD DIAGNOSIS"),),),
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
                      controller: mh_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'MH ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: doctor_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DOCTOR ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: uhid,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'UHID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller:  diagnosis,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DIAGNOSIS',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),





                    ElevatedButton(onPressed: () {
                      add_dagnosis;

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