

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';


class vaccine extends StatefulWidget {
  const vaccine({Key? key}) : super(key :key);

  @override
  State<vaccine> createState() => vaccineState();
}

class vaccineState extends State<vaccine> {

  TextEditingController vaccine_id= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController uhid= new TextEditingController();
  TextEditingController vaccine_name= new TextEditingController();
  TextEditingController dose= new TextEditingController();
  TextEditingController batch_no= new TextEditingController();
  TextEditingController manufacturer= new TextEditingController();
  TextEditingController vaccination_center= new TextEditingController();
  TextEditingController status_= new TextEditingController();








  Future vaccine()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/vaccine.php";
    //json maping user entered details

    Map mapeddate = {
      'vaccine_id': vaccine_id.text,
      'doctor_id': doctor_id.text,
      'uhid': uhid.text,
      'vaccine_name': vaccine_name.text,
      'dose' : dose.text,
      'batch_no' : batch_no.text,
      'manufacturer' : manufacturer.text,
      'vaccination_center' : vaccination_center.text,
      'status_' : status_.text,
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
        appBar: AppBar(title: Center(child: Text("ADD VACCINE REPORT"),),),
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
                      controller: vaccine_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'VACCINE ID',
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
                      controller: vaccine_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'VACCINE NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: dose,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DOSE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: batch_no,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'BATCH NO',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: manufacturer,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'MANUFATURER',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: vaccination_center,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'VACCINATION CENTER',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),

                    SizedBox(height: 30),


                    TextField(
                      controller: status_,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'STATUS',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),






                    ElevatedButton(onPressed: () {
                      vaccine();
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