import 'package:flutter/material.dart';


class MyLogin extends StatefulWidget{
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();


}

class _MyLoginState extends State<MyLogin>{







  get margin => null;
  bool passToggle=true;
  String dropdownvalue = 'Doctor';


  // List of items in our dropdown menu
  var items = [

    'Doctor',
    'User',

  ];

  var Validator;



  @override
  Widget build(BuildContext context){
    var passController;
    return Container(

       decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_img.jpg'), fit: BoxFit.cover)
        ),
        child: Scaffold(

            backgroundColor: Colors.transparent,
            body: Stack(
              children: [


                Container(
                  padding: EdgeInsets.only(left: 35, top: 160),
                  child: Text('Welcome to स्वास्थ्य स्मृति',
                    style: TextStyle(color: Colors.black,fontSize: 33),
                  ),
                ),
                SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.5,
                          right: 35,
                          left: 35),
                      child: Column(
                        children: [


                          Container(

                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:Colors.black )),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              //here include this to get padding
                              child: DropdownButton(



                                isExpanded: true,
                                underline: Container(),
                                alignment: Alignment.bottomCenter,
                                elevation: 0,
                                borderRadius: BorderRadius.circular(10),
                                focusColor: Colors.transparent,
                                //TextStyle(color: Colors.white),

                                value: dropdownvalue,
                                style: const TextStyle(color: Colors.black),

                                icon: const Icon(Icons.keyboard_arrow_down),

                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),

                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;

                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),





                          TextFormField(

                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.black),
                                filled: true,
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )

                            ),

                              autovalidateMode :AutovalidateMode.onUserInteraction,
                              validator : (value){
                                final bool emailValid =
                                RegExp(r'^[a-z A-Z]+$').hasMatch(value!);
                                if(value!.isEmpty){
                                  return "Enter correct email";

                                }else if(value!.isEmpty){
                                  return "Enter Valid Email";


                                }else{
                                  return null;
                                }
                              }

                          ),
                          SizedBox(
                              height: 30
                          ),

                          TextField(
                            obscureText: passToggle,
                            controller: passController,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),

                                suffix: InkWell(
                                  onTap: (){
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
                                )
                            ),
                          ),

                          SizedBox(height: 30,),

                          ElevatedButton(onPressed: () {
                            if(dropdownvalue==items[0]){
                              Navigator.pushNamed(context, 'drhome1');

                            }else if (dropdownvalue == items[1]){
                              Navigator.pushNamed(context, 'userhome');
                            }
                          }, child:Text('LOGIN'),


                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                padding: EdgeInsets.all(10.0),
                                minimumSize: Size(80.0, 60.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),),



                          SizedBox(
                              height: 40
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(onPressed: (){


                                Navigator.pushNamed(context, 'register');
                              }, child: Text('Sign up', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.black
                              ),)),
                              TextButton(onPressed: (){

                              }, child: Text('Forgot Password', style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Colors.black
                              ),))
                            ],
                          )

                        ],
                      ),
                    )
                ),

              ],
            )
        ));


  }
}