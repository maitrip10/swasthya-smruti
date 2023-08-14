

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:swasthya_smruti/add_diagnosis.dart';
import 'package:swasthya_smruti/add_disease.dart';
import 'package:swasthya_smruti/add_prescription.dart';
import 'package:swasthya_smruti/add_symptoms.dart';
import 'package:swasthya_smruti/history.dart';
import 'package:swasthya_smruti/lab_report.dart';
import 'package:swasthya_smruti/show_labreport.dart';
import 'package:swasthya_smruti/vaccine.dart';


class drhome extends StatefulWidget {
  const drhome({Key? key}) : super(key: key);

  @override
  State<drhome> createState() => _drhomeState();
}

class _drhomeState extends State<drhome> {
  int index = 0;
  @override
  Widget build(BuildContext context) {

    List imageList = [

      {"id": 1, "image_path": 'assets/s1.jpg'},
      {"id": 2, "image_path": 'assets/s2.jpeg'},
      {"id": 3, "image_path": 'assets/s4.jpeg'},
      {"id": 4, "image_path": 'assets/s8.jpeg'},
      {"id": 5, "image_path": 'assets/s9.jpeg'},

    ];

    //Name and icon List
    List<Count> data = [
      Count("Show History " ,"assets/hiss1.png",),
      Count("show labreport","assets/labreport.jpg"),
      Count("Add Prescription","assets/pres.jpg"),
      Count("Add Symptoms", "assets/symptoms.jpg"),
      Count("Add Dises", "assets/dis.jpg"),
      Count("Add diagnosis","assets/diagnosis.jpg"),
      Count("Add Lab Report", "assets/labreport.jpg"),
      Count("Add Vaccine", "assets/vaccine.jpg"),


    ];
    final CarouselController carouselController = CarouselController();
    int currentIndex = 0;
    return Scaffold(

      appBar: AppBar(),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Maitri"),
                accountEmail: Text("maitri@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.purpleAccent,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(

                leading: const Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, 'drhome' );

                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('profile'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_info');
                },),

              ListTile(
                leading: Icon(Icons.folder_special),
                title: const Text('Specialization'),
                onTap: () {
                  Navigator.pushNamed(context,'dr_specialization');
                },),

              ListTile(
                leading: Icon(Icons.cast_for_education),
                title: const Text('Doctor degree'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_degree');
                },),

              ListTile(
                leading: Icon(Icons.add_home_outlined),
                title: const Text('Address'),
                onTap: () {
                  Navigator.pushNamed(context, 'address');
                },),

              ListTile(
                leading: Icon(Icons.local_hospital),
                title: const Text('Hospital'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_hospital');
                },),

              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  Navigator.pushNamed(context,'');
                },),

              ListTile(
                leading: Icon(Icons.info_outline_rounded),
                title: const Text('About Us'),
                onTap: () {
                  Navigator.pushNamed(context,'');
                },),

              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },),
            ],
          )),




      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_img.jpg'),fit:BoxFit.cover)),
        child: Stack(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                        item['image_path'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(bottom: 20, left: 0, right: 0, child: Row()),
              ],
            ),

            // gridview biulder
            Padding(
                padding: EdgeInsets.only(
                    top: 200,
                    right: 10,
                    left: 10),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.9,
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.1,
                      mainAxisSpacing:0.1),
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: ()
                      {
                        if (index == 0) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => history()));
                        }
                        if (index == 1) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => show_labreport()));
                        }
                        else if (index == 2) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => add_prescription()));
                        }else if (index == 3) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => add_symptoms()));
                        }else if (index == 4) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>add_disease()));
                        }else if (index == 5) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => add_dagnosis()));

                        }else if (index == 6) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => lab_report()));
                        }else if (index == 7) {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => vaccine()));
                        }
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                      },
                      child: Card(
                        color: Colors.white,
                        elevation: 0.3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        child: Column(
                          children: [
                            Center(child: Image(image: AssetImage(data[index].image),height: 150,width: 190,)),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 29),
                              child: Text(data[index].title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),


                            ),

                          ],
                        ),


                      ),


                    );

                  },

                )),





            // Heading Text
            Positioned(
                top: MediaQuery.of(context).size.height / 4,
                left: MediaQuery.of(context).size.width / 3.5,
                child: Center(
                  child: const Text("",
                      style: TextStyle(fontSize: 30, color: Colors.blue,fontWeight: FontWeight.w900)),
                )),
            SizedBox(height: 30,),
          //  TextButton(onPressed: (){}, child: Text("Highlite Dises")),



          ],

        ),

      ),

    );


  }
}

//For grid
class Count {
  Count(this.title, this.image);

  String title;
  String image;

}