import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/cupertino.dart';



class drhome1 extends StatefulWidget {
  const drhome1({Key? key}) : super(key: key);

  @override
  State<drhome1> createState() => _drhomeState1();
}

class _drhomeState1 extends State<drhome1> {
  int index = 0;
  @override
  Widget build(BuildContext context) {

    List imageList = [

      {"id": 1, "image_path": 'assets/s11.jpeg'},
      {"id": 2, "image_path": 'assets/s12.jpeg'},
      {"id": 3, "image_path": 'assets/s15.jpeg'},
      {"id": 4, "image_path": 'assets/s16.jpeg'},
      {"id": 5, "image_path": 'assets/s19.jpeg'},

    ];
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
      appBar: AppBar(title: Center(child: Text("SEARCH PATIENT")),),
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
                  Navigator.pushNamed(context,'');
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
         Column(

          children: [

            SizedBox(height: 200),

            TextField(

              decoration: InputDecoration(
                  fillColor: Colors.white,filled: true,labelText: 'PATIENT ID(UH ID)',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, 'drhome');
            },
              child: Text("SEARCH"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.all(10.0),
                minimumSize: Size(80.0, 60.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),

              ),),




          ],
    ),
    ],
    ),

    ),
    );

  }
}
class Count {
  Count(this.title, this.image);

  String title;
  String image;

}

