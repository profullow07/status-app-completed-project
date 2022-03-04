import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:flutter/material.dart';

class boxbutton extends StatelessWidget {
  const boxbutton({
    Key? key,
    required this.name,
    required this.subtile,
    required this.Ontap,
    required this.image,
  }) : super(key: key);
  final String name, subtile;
  final Function Ontap;
  final image;

  @override
  Widget build(BuildContext context) {
    final double screenwith = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Ontap();
      },
      child: Container(
        width: screenwith * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5.0, offset: Offset(0, 4))
            ]),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "NotoSerifBengali",
                color: textColor,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subtile,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "NotoSerifBengali",
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
