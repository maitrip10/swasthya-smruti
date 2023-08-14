import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background_img.jpg'),fit:BoxFit.cover)),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 90),
              child: Center(
                child: Text('Registration', style: TextStyle(
                    color: Colors.black,fontSize: 33),
                ),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Doctor",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  width: 90,
                ),
                Text("User",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'dr_info');
                    // do something when the first button is pressed
                  },
                  child: Image.asset(
                    'assets/doctor_logo.png',
                    width: 150,
                    height: 250,
                  ),
                ),
                SizedBox(width: 20), // add some spacing between the buttons
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'user_info');
                    // do something when the second button is pressed
                  },
                  child: Image.asset(
                    'assets/user_logo.png',
                    width: 150,
                    height: 250,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),

            TextButton(onPressed: (){
              Navigator.pushNamed(context, 'login');
            }, child: Text('Already sign up?', style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.black
            ),)),
          ],
        ),
      ),
    );
  }
}

