import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bgwelcome.jpg"), 
                  fit: BoxFit.fitWidth, 
                  alignment: Alignment.center, 
                ),
              ),
            ),
            Positioned(
              top: 180, 
              left: 300, 
              width: 300, 
              height: 180, 
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'images/maskotakhir.svg', 
                    width: 300,
                    height: 150, 
                  ),
                  SizedBox(width: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFABBFC0),
                      borderRadius: BorderRadius.circular(80), 
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Haii selamat datang di kina,',
                            style: TextStyle(color: Colors.white, fontSize: 30, height: 1.2), 
                            maxLines: 1, 
                          ),
                          Text(
                            'kisah nabi adam',
                            style: TextStyle(color: Colors.white, fontSize: 30, height: 1.2), 
                            maxLines: 1, 
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}