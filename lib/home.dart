import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> with SingleTickerProviderStateMixin {
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
myAchive(num, type){
    return  Row(
      children: [
        Text(num, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
        Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(type)),
      ],
    );
}
mySpec(icon, tech){
    return Container(
      width: 105,
      height: 105,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white,),
              SizedBox(
                height: 10,
              ),
              Text(tech, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(

          color: Colors.black,
          icon: Icon(Icons.menu),
          itemBuilder: (context) => [
            PopupMenuItem(child: TextButton(
              child: Text('Projects', style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, 'projects');
              },
            ),
              value: 1,
            ),
            PopupMenuItem(child: TextButton(
              child: Text('About Me',style: TextStyle(color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, 'about');
              },
            ),
              value: 2,
            )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                shaderCallback : (rect) {
                  return LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black, Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },

                  blendMode: BlendMode.dstIn,



                    child: Image.asset("assets/Usamablack.jpg", height: 400, fit: BoxFit.contain,))
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height* 0.45),
                child: Column(
                  children: [
                    Text('Usama Ali', style: TextStyle(color: Colors.white, fontFamily: "Soho",
                        fontSize: 40,fontWeight: FontWeight.w900),),
                    SizedBox(
                      height: 3,
                    ),

                    Text('Flutter Developer', style: TextStyle(color: Colors.white,fontSize: 20, fontFamily: "Soho"),)
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myAchive('78', 'Projects'),
                    myAchive('65', 'Clients'),
                    myAchive('92', 'Messages')



                  ],
                ),
                SizedBox(height: 30,),
                Text('Specialized in',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.android, 'Android'),
                        mySpec(Icons.flutter_dash, 'Flutter'),
                        mySpec(Icons.design_services, 'Designing'),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.android, 'Android'),
                        mySpec(Icons.flutter_dash, 'Flutter'),
                        mySpec(Icons.design_services, 'Designing'),

                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySpec(Icons.developer_board, 'AI Dev'),
                        mySpec(Icons.ios_share, 'IOS Dev'),
                        mySpec(Icons.desktop_mac, 'Desktop Dev'),

                      ],
                    )
                  ],
                )
              ],
            )
          );
        },
      ),
    );
  }
}