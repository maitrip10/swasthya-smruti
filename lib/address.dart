

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class address extends StatefulWidget {
  const address({Key? key}) : super(key :key);

  @override
  State<address> createState() => addressState();
}

class addressState extends State<address> {

  int selectedValue = 1;


  TextEditingController address_id= new TextEditingController();
  TextEditingController address_type= new TextEditingController();
  TextEditingController doctor_id= new TextEditingController();
  TextEditingController uhid= new TextEditingController();
  TextEditingController addressline1= new TextEditingController();
  TextEditingController addressline2= new TextEditingController();
  TextEditingController city= new TextEditingController();
  TextEditingController sub_district= new TextEditingController();
  TextEditingController district= new TextEditingController();
  TextEditingController state_= new TextEditingController();
  TextEditingController country= new TextEditingController();
  TextEditingController pincode= new TextEditingController();

  Future address_()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/address_.php";
    //json maping user entered details

    Map mapeddate = {
      'address_id': address_id.text,
      'address_type': address_type.text,
      'doctor_id': doctor_id.text,
      'uhid': uhid.text,
      'addressline1' : addressline1.text,
      'addressline2' : addressline2.text,
      'city' : city.text,
      'sub_district' : sub_district.text,
      'district' : district.text,
      'state_' : state_.text,
      'country' : country.text,
      'pincode' : pincode.text,
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
        appBar: AppBar(title: Center(child: Text("ADDRESS"),),),
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
                      controller: address_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'ADDRESS ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: address_type,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'ADDRESS TYPE',
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
                      controller: addressline1,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'ADDRESS LINE-1',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: addressline2,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'ADDRESS LINE-2',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: city,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'CITY',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: sub_district,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'SUB-DISTRICT',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: district,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DISTRICT',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: state_,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'STATE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: country,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'COUNTRY',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: pincode,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PIN-CODE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),







                    ElevatedButton(onPressed: () {
                      address_();
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