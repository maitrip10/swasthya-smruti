

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';


class dr_degree extends StatefulWidget {
  const dr_degree({Key? key}) : super(key :key);

  @override
  State<dr_degree> createState() => dr_degreeState();
}

class dr_degreeState extends State<dr_degree> {

  TextEditingController degree_id= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController degree= new TextEditingController();
  TextEditingController university= new TextEditingController();
  TextEditingController college= new TextEditingController();
  TextEditingController passing_class= new TextEditingController();
  TextEditingController passing_from= new TextEditingController();
  TextEditingController passing_year= new TextEditingController();







  Future dr_degree()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/degree.php";
    //json maping user entered details

    Map mapeddate = {
      'degree_id': degree_id.text,
      'doctor_id': doctor_id.text,
      'degree': degree.text,
      'university': university.text,
      'college' : college.text,
      'passing_class' : passing_class.text,
      'passing_from' : passing_from.text,
      'passing_year' : passing_year.text,


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
        appBar: AppBar(title: Center(child: Text("DOCTOR DEGREE"),),),
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
                      controller: degree_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DEGREE ID',
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
                      controller: degree,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DEGREE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: university,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'UNIVERSITY',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: college,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'COLLEGEE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: passing_class,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PASSING CLASS',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: passing_from,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PASSING FROM',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: passing_year,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PASSING YEAR',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),






                    ElevatedButton(onPressed: () {
                      dr_degree();
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