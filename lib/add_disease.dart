

import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';


class add_disease extends StatefulWidget {
  const add_disease({Key? key}) : super(key :key);

  @override
  State<add_disease> createState() => add_diseaseState();
}

class add_diseaseState extends State<add_disease> {


final TextEditingController diseaseController = TextEditingController();

void clearTextFields(){
  diseaseController.clear();
}

  TextEditingController disease_id= new TextEditingController();
  TextEditingController mh_id= new TextEditingController();
  TextEditingController disease= new TextEditingController();



  Future add_disease()  async {
    // url to registration php script
    var APIURL = "https://capstone2501.000webhostapp.com/php/disease.php";
    //json maping user entered details

    Map mapeddate = {
      'disease_id': disease_id.text,
      'mh_id': mh_id.text,
      'disease': disease.text,

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
        appBar: AppBar(title: Center(child: Text("ADD DISEASE"),),),
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

                      controller: disease_id,
                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DISEASE ID',
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
                      controller: disease,

                      decoration: InputDecoration(
                          fillColor: Colors.white,filled: true,labelText: 'DISEASE',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                      ),
                    ),
                    SizedBox(height: 30),




                    ElevatedButton(onPressed: () {
                      clearTextFields();
                      add_disease();
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