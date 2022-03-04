import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:all_status_bangla/model/model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:all_status_bangla/Screen/button/favoritebutton.dart';
import 'package:all_status_bangla/Screen/button/sharebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sadscreen extends StatefulWidget {
  const Sadscreen({Key? key}) : super(key: key);

  @override
  _SadscreenState createState() => _SadscreenState();
}

class _SadscreenState extends State<Sadscreen> {
  String copytext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: textColor,
        elevation: 3.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "দুঃখ-কষ্ট স্ট্যাটাস",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSerifBengali",
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: sadMOdel.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.darken,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 3.0,
                          )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            copytext = sadMOdel[index].quates,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: textColor,
                                ),
                                onPressed: () {
                                  Clipboard.setData(
                                          ClipboardData(text: copytext))
                                      .then((value) {
                                    return Fluttertoast.showToast(
                                        msg: "Copied Success");
                                  });
                                },
                                icon: Icon(Icons.copy),
                                label: Text("COPY")),
                          ),
                          Favoritebuton(),
                          Sharebutton(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
