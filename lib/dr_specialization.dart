

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class dr_specialization extends StatefulWidget {
  const dr_specialization({Key? key}) : super(key :key);

  @override
  State<dr_specialization> createState() => dr_specializationState();
}

class dr_specializationState extends State<dr_specialization> {

  TextEditingController specialization_id= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController specialization_name= new TextEditingController();








  Future dr_specialization()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/specialization.php";
    //json maping user entered details

    Map mapeddate = {
      'specialization_id': specialization_id.text,
      'doctor_id': doctor_id.text,
      'specialization_name': specialization_name.text,

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
        appBar: AppBar(title: Center(child: Text("SPECIALIZATION"),),),
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
                      controller: specialization_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'SPECIALIZATION ID',
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
                      controller: specialization_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'SPECIALIZATION NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),




                    ElevatedButton(onPressed: () {
                      dr_specialization();
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