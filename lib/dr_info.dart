

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;


class dr_info extends StatefulWidget {
  const dr_info({Key? key}) : super(key :key);

  @override
  State<dr_info> createState() => dr_infoState();
}
enum GenderEnum { male, female, other}

class dr_infoState extends State<dr_info> {

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

  TextEditingController doctor_id= new TextEditingController();
  TextEditingController first_name= new TextEditingController();
  TextEditingController middle_name= new TextEditingController();
  TextEditingController last_name= new TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController contact= new TextEditingController();
  TextEditingController email= new TextEditingController();
  TextEditingController password_= new TextEditingController();
  TextEditingController aadharcard= new TextEditingController();
  TextEditingController license_number= new TextEditingController();
  TextEditingController medical_council= new TextEditingController();
  TextEditingController verification_status= new TextEditingController();








  Future dr_info()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/doctor.php";
    //json maping user entered details


    Map mapeddate = {
      'doctor_id': doctor_id.text,
      'first_name': first_name.text,
      'middle_name': middle_name.text,
      'last_name': last_name.text,
      'date' : date.text,
      'contact' : contact.text,
      'email' : email.text,
      'password_' : password_.text,
      'aadharcard' : aadharcard.text,
      'license_number' : license_number.text,
      'medical_council' : medical_council.text,
      'verification_status' : verification_status.text,
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
        appBar: AppBar(title: Center(child: Text("DR_INFORMATION"),),),
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
                      controller: doctor_id,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DOCTOR ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: first_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'FIRST NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: middle_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'MIDDLE NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: last_name,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'LAST NAME',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

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
                          fillColor: Colors.white,filled: true,labelText: 'CONTECT NO.',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: email,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'EMAIL ID',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: password_,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'PASSWORD',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: aadharcard,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'AADHAR NUMBER',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: license_number,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'LICENSE NUMBER',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),


                    TextField(
                      controller: medical_council,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'MEDICAL COUNCIL',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),

                    TextField(
                      controller: verification_status,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'VERIFICATION STATUS',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),






                    ElevatedButton(onPressed: () {
                      dr_info();
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



