import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';


class show_labreport extends StatefulWidget {
  const show_labreport({Key? key}) : super(key: key);

  @override
  State<show_labreport> createState() => show_labreportState();
}

class show_labreportState extends State<show_labreport> {
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
            child: Text("SHOW LAB REPORT"),
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
                              icon: Icon(Icons.calendar_today_rounded),
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: "FROM DATE:"),
                          onTap: () async {
                            final DateTime? pickedded = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));
                            if (pickedded != null) {
                              String formate =
                              DateFormat('dd-MM-yyyy').format(pickedded);
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
                              icon: Icon(Icons.calendar_today_rounded),
                              labelStyle: TextStyle(color: Colors.black),
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
                              DateFormat('dd-MM-yyyy').format(pick);
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
