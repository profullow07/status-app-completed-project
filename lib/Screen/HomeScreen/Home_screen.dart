import 'package:all_status_bangla/Colors/colors_code.dart';
import 'package:all_status_bangla/Screen/HomeScreen/DetailsPage.dart';
import 'package:all_status_bangla/Screen/HomeScreen/privacy_policy.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:all_status_bangla/Screen/HomeScreen/button_screen.dart';

import 'package:all_status_bangla/Screen/widget/Lonly_screen.dart';
import 'package:all_status_bangla/Screen/widget/MomDad_page.dart';
import 'package:all_status_bangla/Screen/widget/birtday_page.dart';
import 'package:all_status_bangla/Screen/widget/friend_page.dart';
import 'package:all_status_bangla/Screen/widget/love_page.dart';
import 'package:all_status_bangla/Screen/widget/romantic_screen%20dart';
import 'package:all_status_bangla/Screen/widget/Emosotional_screen.dart';
import 'package:all_status_bangla/Screen/widget/sad_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
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
  late InterstitialAd _interstitialAd;

  bool isAdload = false;

  @override
  void initState() {
    super.initState();
    initBannerAd();
    interstiAd();
  }

  void interstiAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3217292006726724/7964902738',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            this._interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  void onAdLoaded(InterstitialAd ad) {
    isAdload = true;
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

  initBannerAd() {
    myBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3217292006726724/9386877186',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isAdload = true;
          });
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: AdRequest(),
    );
    myBanner.load();
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.load();
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
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
          "?????? ??????????????????????????? ???????????????",
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
                    "?????? ??????????????????????????? ???????????????",
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
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Romanticepage()));
                    },
                    image: "assets/images/rom.png",
                    name: "?????????????????????????????????",
                    subtile: "??????????????????????????????????????? ???????????????????????????",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isAdload) {
                        _interstitialAd.show();
                      }

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Emosotinoalpage()));
                    },
                    image: "assets/images/emo.jpg",
                    name: "?????????????????????",
                    subtile: "??????????????????????????? ???????????????????????????",
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
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LovePage()));
                    },
                    image: "assets/images/lov.png",
                    name: "?????????????????????",
                    subtile: "???????????????????????? ???????????????????????????",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sadscreen()));
                    },
                    image: "assets/images/sad.png",
                    name: "????????????-????????????",
                    subtile: "????????????-?????????????????? ???????????????????????????",
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
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BirthdayPage()));
                    },
                    image: "assets/images/bith.png",
                    name: "?????????????????????",
                    subtile: "??????????????????????????? ???????????????????????????",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FriendPage()));
                    },
                    image: "assets/images/frnd.png",
                    name: "???????????????",
                    subtile: "???????????????????????? ???????????????????????????",
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
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MomdadPage()));
                    },
                    image: "assets/images/motfa.png",
                    name: "??????-????????????",
                    subtile: "??????-??????????????? ???????????????????????????",
                  ),
                  boxbutton(
                    Ontap: () {
                      if (isAdload) {
                        _interstitialAd.show();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Alonepage()));
                    },
                    image: "assets/images/lon.png",
                    name: "????????????????????????",
                    subtile: "?????????????????????????????? ???????????????????????????",
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
      bottomNavigationBar: isAdload
          ? Container(
              width: myBanner.size.width.toDouble(),
              height: myBanner.size.height.toDouble(),
              child: AdWidget(ad: myBanner),
            )
          : SizedBox(),
    );
  }
}
