

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class add_symptoms extends StatefulWidget {
  const add_symptoms({Key? key}) : super(key :key);

  @override
  State<add_symptoms> createState() => add_symptomsState();
}

class add_symptomsState extends State<add_symptoms> {

  TextEditingController symptoms_id= new TextEditingController();
  TextEditingController mh_id= new TextEditingController();
  TextEditingController symptoms= new TextEditingController();


  Future add_symptoms()  async {
    // url to registration php script


    var APIURL = "https://capstone2501.000webhostapp.com/php/symptoms.php";
    //json maping user entered details

    Map mapeddate = {
      'symptoms_id': symptoms_id.text,
      'mh_id': mh_id.text,
      'symptoms': symptoms.text,

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
        appBar: AppBar(title: Center(child: Text("ADD SYMPTOMS"),),),
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
                      controller: symptoms_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'SYMPTOMS ID',
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
                      controller: symptoms,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'SYMPTOMS',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),




                    ElevatedButton(onPressed: () {
                      add_symptoms();
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