import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> with SingleTickerProviderStateMixin {
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
myPro(lang, title, dec, star){
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width*0.9,

      child: Card(
        color: Color(0xff262628),
        child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lang, style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(
                  height: 10,
                ),
                Text(title, style: TextStyle(color: Colors.white,
                    fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),
                Text(dec, style: TextStyle(color: Colors.white70, fontSize: 16)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.white70,size: 18,),
                    SizedBox(
                      width: 4,
                    ),
                    Text(star, style: TextStyle( color: Colors.white70),),
                    Expanded(child: Container()),
                    IconButton(onPressed:(){
                      launchlink("github:https://github.com/usamaali3742/",
                          "https://www.github.com/usamaali3742/");
                    }, icon: Icon(FontAwesomeIcons.github, color: Colors.white70,))
                  ],
                )


              ],

            )
        ),
      ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

      backgroundColor: Color(0xff252525),
      title: Text('Projects'),
    ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myPro('FLUTTER', 'Click to Code', 'An Online Compiler', '10'),
              myPro('FLUTTER', 'Click to Code', 'An Online Compiler', '10'),
              myPro('FLUTTER', 'Click to Code', 'An Online Compiler', '10'),
              myPro('FLUTTER', 'Click to Code', 'An Online Compiler', '10'),
              myPro('FLUTTER', 'Click to Code', 'An Online Compiler', '10')




            ],
          ),
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
}
