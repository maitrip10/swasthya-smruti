

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;


class user_info extends StatefulWidget {
  const user_info({Key? key}) : super(key :key);

  @override
  State<user_info> createState() => user_infoState();

}
enum GenderEnum { male, female, other}

class user_infoState extends State<user_info> {


  GenderEnum? gender;

  String Fgender = "";

  Future insertValue() async {
    if (gender.toString() == "GenderEnum.male") {
      Fgender = "male";
    }
    if (gender.toString() == "GenderEnum.female") {
      Fgender = "female";
    }
    if (gender.toString() == "GenderEnum.other") {
      Fgender = "other";
    }
  }

  TextEditingController uhid= new TextEditingController();
  TextEditingController first_name= new TextEditingController();
  TextEditingController middle_name= new TextEditingController();
  TextEditingController last_name= new TextEditingController();
  TextEditingController contact= new TextEditingController();
  TextEditingController email= new TextEditingController();
  TextEditingController upass= new TextEditingController();
  TextEditingController aadharcard= new TextEditingController();
  TextEditingController profession= new TextEditingController();
  TextEditingController date = TextEditingController();


  Future user_info()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/user.php";
    //json maping user entered details

    Map mapeddate = {
      'uhid': uhid.text,
      'first_name': first_name.text,
      'middle_name': middle_name.text,
      'last_name': last_name.text,
      'date': date.text,
      'contact': contact.text,
      'email': email.text,
      'upass': upass.text,
      'aadharcard': aadharcard.text,
      'profession': profession.text,

    };
    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here

    var data = jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_img.jpg'), fit: BoxFit.cover)),

      child: Scaffold(

        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Center(child: Text("USER INFOMATION"),),),
        body: Stack(

          children: [
            Container(
              padding: EdgeInsets.only(left: 85, top: 98),

            ),
            SingleChildScrollView(
              child: Container(


                padding: EdgeInsets.only(top: 80, right: 35, left: 35),
                child: Column(
                  children: [
                    TextField(
                      controller: uhid,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'UHID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: first_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'FIRST NAME',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: middle_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'MIDDLE NAME',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: last_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'LAST NAME',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),



                    SizedBox(height: 30),

                    Row(
                        children: [
                          Text("Gender"),
                          SizedBox(width: 20,),
                          Expanded(
                            child:
                            RadioListTile<GenderEnum>(
                                contentPadding: EdgeInsets.all(0.0),
                                value: GenderEnum.male,
                                dense: true,
                                title: Text(GenderEnum.male.name),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                }
                            ),
                          ),
                          SizedBox(width: 0,),
                          Expanded(
                            child: RadioListTile<GenderEnum>(
                                contentPadding: EdgeInsets.all(0.0),
                                value: GenderEnum.female,
                                dense: true,
                                title: Text(GenderEnum.female.name),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                }
                            ),
                          ),
                          SizedBox(width: 0,),
                          Expanded(
                            child: RadioListTile<GenderEnum>(
                                contentPadding: EdgeInsets.all(0.0),
                                value: GenderEnum.other,
                                dense: true,
                                title: Text(GenderEnum.other.name),
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                }
                            ),
                          ),
                        ],
                       ),


                    TextField(
                        controller: date,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            labelStyle: TextStyle(color: Colors.black),
                            icon: Icon(Icons.calendar_today_rounded),
                            labelText: "BIRTH DATE:"),
                        onTap: () async {
                          final DateTime? pickedded = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedded != null) {
                            String formate =
                            DateFormat('yyyy-MM-dd').format(pickedded);
                            print(formate);
                            setState(() {
                              date.text = formate;
                            });
                          } else {
                            print("Date is not found");
                          }
                        }),
                    SizedBox(height: 30),

                    TextField(
                      controller: contact,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'CONTACT NO',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: email,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'EMAIL ID',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: upass,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: aadharcard,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'AADHAR NUMBER',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: profession,

                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          labelText: 'PROFESSION',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    ElevatedButton(onPressed: () {
                      user_info();
                    }, child: Text('SAVE'),


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




