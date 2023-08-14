


import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:swasthya_smruti/history.dart';
import 'package:swasthya_smruti/show_labreport.dart';


class userhome extends StatefulWidget {
  const userhome({Key? key}) : super(key: key);

  @override
  State<userhome> createState() => _userhomeState();
}

class _userhomeState extends State<userhome> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List imageList = [

      {"id": 1, "image_path": 'assets/s20.jpeg'},
      {"id": 2, "image_path": 'assets/s21.jpeg'},
      {"id": 3, "image_path": 'assets/s23.jpeg'},
      {"id": 4, "image_path": 'assets/s24.jpeg'},
      {"id": 5, "image_path": 'assets/s27.jpeg'},
    ];

    //Name and icon List
    List<Count> data = [
      Count(" show History " ,"assets/hiss1.png"),
      Count("show_labreport","assets/labreport.jpg"),





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
                  Navigator.pushNamed(context, 'userhome' );

                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text('profile'),
                onTap: () {
                  Navigator.pushNamed(context, 'user_info');
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
                    right:  10,
                    left: 10),
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.6,
                      crossAxisCount: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing:1),
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
                                  left: MediaQuery.of(context).size.width / 40),
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
            SizedBox(height: 25,),
            //TextButton(onPressed: (){}, child: Text("Highlite Dises")),

            // Background image


            // Heading Text
            Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: MediaQuery.of(context).size.width / 4.5,
                child: Center(
                  child: const Text("",
                      style: TextStyle(fontSize: 30, color: Colors.blue,fontWeight: FontWeight.w900)),
                )),


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