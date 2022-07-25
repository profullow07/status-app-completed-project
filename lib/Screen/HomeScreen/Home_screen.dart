import 'dart:developer';

import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:all_status_bangla/Screen/HomeScreen/DetailsPage.dart';
import 'package:all_status_bangla/Screen/HomeScreen/FiveStar.dart';
import 'package:all_status_bangla/Screen/HomeScreen/privacy_policy.dart';
import 'package:all_status_bangla/model/AdHelper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:all_status_bangla/Screen/HomeScreen/button_screen.dart';

import 'package:all_status_bangla/Screen/widget/Lonly_screen.dart';
import 'package:all_status_bangla/Screen/widget/MomDad_page.dart';
import 'package:all_status_bangla/Screen/widget/birtday_page.dart';
import 'package:all_status_bangla/Screen/widget/friend_page.dart';
import 'package:all_status_bangla/Screen/widget/love_page.dart';
import 'package:all_status_bangla/Screen/widget/romantic_screen.dart';
import 'package:all_status_bangla/Screen/widget/Emosotional_screen.dart';
import 'package:all_status_bangla/Screen/widget/sad_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int _dotPosition = 0;
  List<String> imagUrl = [
    "assets/images/slider_1.jpeg",
    "assets/images/slider_2.jpeg",
    "assets/images/slider_3.jpeg",
    "assets/images/slider_4.jpeg",
  ];

  late BannerAd myBanner;
  bool isbannerAdload = false;

  late InterstitialAd _interstitialAd;
  bool isInterstitialAdload = false;

  @override
  void initState() {
    super.initState();
    initBannerAd();
    interstiAd();
  }

  void interstiAd() async {
    await InterstitialAd.load(
        adUnitId: AdHelper.intertistialAD(),
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            log("Interstitial Ads Loaded");
            this._interstitialAd = ad;
            isInterstitialAdload = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            log(error.toString());
            isInterstitialAdload = false;
          },
        ));
  }

  void onAdLoaded(InterstitialAd ad) {
    isInterstitialAdload = true;
    _interstitialAd = ad;
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "অল স্ট্যাটাস বাংলা",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "NotoSerifBengali",
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.green,
                width: double.infinity,
                child: DrawerHeader(
                  child: Text(
                    "অল স্ট্যাটাস বাংলা",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "NotoSerifBengali",
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_screen()));
                },
                leading: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyPage()));
                },
                leading: Icon(Icons.privacy_tip),
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
                },
                leading: Icon(Icons.details),
                title: Text(
                  "Details Apps",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FiveStarPage()));
                },
                leading: Icon(Icons.star),
                title: Text(
                  "Apps Review",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Version:1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2.0,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (val, carouselPageChangedReason) {
                        setState(() {
                          _dotPosition = val;
                        });
                      }),
                  items: imagUrl
                      .map((item) => Container(
                            margin: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(item),
                                  fit: BoxFit.fill,
                                )),
                          ))
                      .toList(),
                ),
              ),
              DotsIndicator(
                dotsCount: imagUrl.length == 0 ? 1 : imagUrl.length,
                position: _dotPosition.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Colors.red,
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(15, 15),
                  size: Size(10, 10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Romanticepage()));
                    },
                    image: "assets/images/rom.png",
                    name: "রোম্যান্টিক",
                    subtile: "রোম্যান্টিকের স্ট্যাটাস",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Emosotinoalpage()));
                    },
                    image: "assets/images/emo.jpg",
                    name: "ইমোশনাল",
                    subtile: "ইমোশনালের স্ট্যাটাস",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LovePage()));
                    },
                    image: "assets/images/lov.png",
                    name: "ভালবাসা",
                    subtile: "ভালবাসার স্ট্যাটাস",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sadscreen()));
                    },
                    image: "assets/images/sad.png",
                    name: "দুঃখ-কষ্ট",
                    subtile: "দুঃখ-কস্টের স্ট্যাটাস",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BirthdayPage()));
                    },
                    image: "assets/images/bith.png",
                    name: "জন্মদিন",
                    subtile: "জন্মদিনের স্ট্যাটাস",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendPage()));
                    },
                    image: "assets/images/frnd.png",
                    name: "বন্ধু",
                    subtile: "বন্ধুদের স্ট্যাটাস",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MomdadPage()));
                    },
                    image: "assets/images/motfa.png",
                    name: "মা-বাবা",
                    subtile: "মা-বাবার স্ট্যাটাস",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isInterstitialAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Alonepage()));
                    },
                    image: "assets/images/lon.png",
                    name: "একাকিত্ব",
                    subtile: "একাকিত্বের স্ট্যাটাস",
                  ),
                ],
              ),
              Divider(
                thickness: 5,
                color: Colors.white,
                height: 40,
              ),
            ],
          ),
        ),
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
