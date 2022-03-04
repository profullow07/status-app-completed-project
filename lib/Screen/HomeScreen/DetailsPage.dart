import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Devloper Information"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Apps Abouts",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
                "This is Status app,In this app have maney type of status.\nfacebook status,romantic status,sad staus,friend status,mom dad status or maney others type.\nif you like this status please share my apps your friend.\nThank you "),
            Text(
              "Contact Us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
                "If you have any questions or suggestions about our apps, do not hesitate to contact us at"),
            Text(
              "profullowonline121@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            Text(
              "Skype:	profullow.kumar",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
              ),
            )
          ],
        ),
      )),
    );
  }
}
