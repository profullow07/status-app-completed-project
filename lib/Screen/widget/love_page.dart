import 'dart:developer';

import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:all_status_bangla/model/AdHelper.dart';
import 'package:all_status_bangla/model/model.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:all_status_bangla/Screen/button/favoritebutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LovePage extends StatefulWidget {
  const LovePage({Key? key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  String copytext = "";
  int selection = 0;

  late BannerAd myBanner;
  bool isbannerAdload = false;
  @override
  void initState() {
    super.initState();
    initBannerAd();
  }

  initBannerAd() async {
    myBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannnerAD(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          log("Banner ads loaded");
          setState(() {
            isbannerAdload = true;
          });
        },
        onAdClosed: (ad) {
          ad.dispose();
          isbannerAdload = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isbannerAdload = false;
        },
      ),
      request: AdRequest(),
    );
    await myBanner.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.load();
  }


  Future<void> share(String copytext) async {
    await FlutterShare.share(
      title: 'SHARE TEXT YOUR FRIENDS',
      text: copytext,
      linkUrl: "https://play.google.com/store/apps/details?id=com.borolocit.allstatusbd",
    );
  }
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
          "ভালবাসার স্ট্যাটাস",
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
            itemCount: loveModel.length,
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
                            copytext = loveModel[index].quates,
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
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selection = index;
                                    share(copytext).toString();
                                  });
                                },
                                icon: Icon(Icons.share),
                                label: Text("SHARE")),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
      bottomNavigationBar: isbannerAdload
          ? Container(
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
              child: AdWidget(ad: myBanner),
            )
          : SizedBox(),
    );
  }
}
