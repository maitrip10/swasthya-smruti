import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';


class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => MyhistorytState();
}

class MyhistorytState extends State<history> {
  TextEditingController date = TextEditingController();
  TextEditingController date1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background_img.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text("HISTORY"),
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80, right: 35, left: 35),
            ),
            SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, right: 35, left: 35),
                  child: Column(
                    children: [
                      TextField(

                          controller: date,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "FROM DATE:"),
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
                      const SizedBox(height: 50),
                      TextField(

                          controller: date1,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "TO DATE:"),
                          onTap: () async {
                            DateTime? pick = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pick != null) {
                              String formate =
                              DateFormat('yyyy-MM-dd').format(pick);
                              print(formate);
                              setState(() {
                                date1.text = formate;
                              });
                            } else {
                              print("Date is not found");
                            }
                          }),
                      const SizedBox(height: 50),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [


                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                padding: const EdgeInsets.all(10.0),
                                minimumSize: const Size(80.0, 60.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text('VIEW'),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),

      ),
    );
  }
}
