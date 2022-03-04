import 'package:flutter/material.dart';

import 'package:flutter_share/flutter_share.dart';

class Sharebutton extends StatelessWidget {
  const Sharebutton({
    Key? key,
  }) : super(key: key);

  Future<void> share(String copytext) async {
    await FlutterShare.share(
      title: 'Share This Apps',
      text: 'Its Not Completed',
      linkUrl: 'https://flutter.dev/',
    );
  }

  @override
  Widget build(BuildContext context) {
    String copytext = "";
    return SizedBox(
      height: 50,
      width: 120,
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: () {
            share(copytext);
          },
          icon: Icon(Icons.share),
          label: Text("SHARE")),
    );
  }
}
