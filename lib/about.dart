
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MyAbout extends StatefulWidget {
  const MyAbout({Key? key}) : super(key: key);

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 60),
                child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black, Colors.transparent
                          ]).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },

                    blendMode: BlendMode.dstIn,


                    child: Image.asset("assets/Usamablack.jpg", height: 400,
                      fit: BoxFit.contain,))
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height * 0.55),
              child: Column(
                  children: [
                    Text('Hello I am', style: TextStyle(color: Colors.white,
                        fontSize: 25),),
                    SizedBox(
                      height: 20,
                    ),

                    Text('Usama Ali', style: TextStyle(color: Colors.white,
                        fontSize: 40, fontWeight: FontWeight.w900),),
                    SizedBox(
                      height: 10,
                    ),

                    Text('Flutter Developer',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 120,
                      child: Card(
                        elevation: 5,
                        child: TextButton(onPressed: () {
                          launchCaller();

                        }, child: Text('Hire Me', style: TextStyle(
                            fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,),),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {
                          launchlink("instagram://user?username=dubaicryptobulls", "https://www.instagram.com/dubaicryptobulls");
                        }, icon: Icon(
                          FontAwesomeIcons.instagram, color: Colors.white,
                        )),


                        IconButton(onPressed: () {
                          launchlink("facebook://facebook.com/profile.php?id=100006123845382", "https://www.facebook.com/profile.php?id=100006123845382");
                        }, icon: Icon(
                          FontAwesomeIcons.facebook, color: Colors.white,
                        )),

                        IconButton(onPressed: () {
                          launchlink("twitter:https://twitter.com/DubaiCryptoBuls", "https://twitter.com/DubaiCryptoBuls");
                        }, icon: Icon(
                          FontAwesomeIcons.twitter, color: Colors.white,
                        )),


                        IconButton(onPressed: () {
                          launchlink("github:https://github.com/usamaali3742/",
                              "https://www.github.com/usamaali3742/");
                        }, icon: Icon(
                          FontAwesomeIcons.github, color: Colors.white,
                        ))
                      ],
                    )
                  ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> launchlink( nurl, weburl) async {
    var nativeUrl = nurl;
    var webUrl = weburl;

    try {
      await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      print(e);
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }
  launchCaller() async {
    const url = "tel:03119716877";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}