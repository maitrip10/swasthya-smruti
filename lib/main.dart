






import 'package:flutter/material.dart';
import 'package:swasthya_smruti/register.dart';
import 'package:swasthya_smruti/add_diagnosis.dart';
import 'package:swasthya_smruti/add_disease.dart';
import 'package:swasthya_smruti/add_prescription.dart';
import 'package:swasthya_smruti/add_symptoms.dart';
import 'package:swasthya_smruti/address.dart';
import 'package:swasthya_smruti/dr_degree.dart';
import 'package:swasthya_smruti/dr_hospital.dart';
import 'package:swasthya_smruti/dr_info.dart';
import 'package:swasthya_smruti/dr_specialization.dart';
import 'package:swasthya_smruti/drhome.dart';
import 'package:swasthya_smruti/drhome1.dart';
import 'package:swasthya_smruti/history.dart';
import 'package:swasthya_smruti/lab_report.dart';
import 'package:swasthya_smruti/login.dart';
import 'package:swasthya_smruti/logo.dart';
import 'package:swasthya_smruti/show_labreport.dart';
import 'package:swasthya_smruti/user_info.dart';
import 'package:swasthya_smruti/userhome.dart';
import 'package:swasthya_smruti/vaccine.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

// await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'logo',
    routes: {
      'logo' : (context) => Mylogo(),
      'login' : (context) => MyLogin(),
      'register' : (context) => register(),
      'dr_info' : (context) =>dr_info(),
      'dr_degree' : (context) =>dr_degree(),
      'dr_hospital' :(context) => dr_hospital(),
      'user_info' : (context) => user_info(),
      'address' : (context) => address(),
      'dr_specialization' : (context) => dr_specialization(),
      'add_diagnosis' :(context) => add_dagnosis(),
      'add_disease' :(context) =>add_disease(),
      'add_prescription' : (context) =>add_prescription(),
      'add_symptoms' : (context) =>add_symptoms(),
      'lab_report' : (context) => lab_report(),
      'vaccine' : (context) => vaccine(),
      'drhome' : (context) =>drhome(),
      'drhome1' : (context) => drhome1(),
      'history' : (context) => history(),
      'show_labreport' : (context) => show_labreport(),
      'userhome' : (context) => userhome()



    },

  ));
}


