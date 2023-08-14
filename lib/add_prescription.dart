

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class add_prescription extends StatefulWidget {
  const add_prescription({Key? key}) : super(key :key);

  @override
  State<add_prescription> createState() => add_prescriptionState();
}

class add_prescriptionState extends State<add_prescription> {


  TextEditingController prescription_id= new TextEditingController();
  TextEditingController mh_id= new TextEditingController();
  TextEditingController drug_name= new TextEditingController();
  TextEditingController type_= new TextEditingController();
  TextEditingController qty= new TextEditingController();
  TextEditingController unit= new TextEditingController();
  TextEditingController drug_time= new TextEditingController();








  Future add_prescription()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/prescription.php";
    //json maping user entered details

    Map mapeddate = {
      'prescription_id': prescription_id.text,
      'mh_id': mh_id.text,
      'drug_name': drug_name.text,
      'type_': type_.text,
      'qty' : qty.text,
      'unit' : unit.text,
      'drug_time' : drug_time.text
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
        appBar: AppBar(title: Center(child: Text("ADD PRESCRIPTION"),),),
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
                      controller: prescription_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PRESCRIPTION ID',
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
                      controller: drug_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DRUG NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: type_,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'TYPE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: qty,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'QTY',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: unit,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'UNIT',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: drug_time,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DRUG TIME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),








                    ElevatedButton(onPressed: () {
                      add_prescription();
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