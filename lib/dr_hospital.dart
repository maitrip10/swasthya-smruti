

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart'as http;


class dr_hospital extends StatefulWidget {
  const dr_hospital({Key? key}) : super(key :key);

  @override
  State<dr_hospital> createState() => dr_hospitalState();
}

class dr_hospitalState extends State<dr_hospital> {

  TextEditingController hospital_id= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController hospital_name= new TextEditingController();
  TextEditingController post= new TextEditingController();
  TextEditingController hospital_license= new TextEditingController();
  TextEditingController city= new TextEditingController();
  TextEditingController working_from= new TextEditingController();






  Future dr_hospital()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/hospital.php";
    //json maping user entered details

    Map mapeddate = {
      'hospital_id': hospital_id.text,
      'doctor_id': doctor_id.text,
      'hospital_name': hospital_name.text,
      'post': post.text,
      'hospital_license' : hospital_license.text,
      'city' : city.text,
      'working_from' : working_from.text
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
        appBar: AppBar(title: Center(child: Text("HOSPITAL"),),),
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
                      controller: hospital_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'HOSPITAL ID',
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
                      controller: hospital_name,


                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'HOSPITAL/CLINIC NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: post,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'POST',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: hospital_license,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'HOSPITAL/CLINIC LICENCE NO',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: city,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'HOSPITAL/CLINIC CITY',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: working_from,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'WORKING FROM',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),




                    ElevatedButton(onPressed: () {
                      dr_hospital();
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