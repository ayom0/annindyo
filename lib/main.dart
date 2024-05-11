import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Atur preferensi sistem untuk membuat aplikasi menjadi fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (context, orientation) {
          // Periksa orientasi layar
          if (orientation == Orientation.portrait) {
            // Jika dalam orientasi potret, ubah menjadi landscape
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]);
          }
          // Return Scaffold dengan teks 'haloo'
          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  // Container biru
                  Container(
                    width: MediaQuery.of(context).size.width, // Lebar container amber sesuai dengan lebar layar
                    height: MediaQuery.of(context).size.height, // Tinggi container amber sesuai dengan tinggi layar
                    color: Colors.amber,
                    child: Center(
                      
                    ),
                  ),
                  // Container merah (di atas container biru)
                  Positioned(
                    left: 129.5, // Atur posisi x
                    top: 0, // Atur posisi y mendekati 0 (mepet di atas layar)
                    child: Container(
                      width: 100,
                      height: 190,
                      color: Colors.red,
            
                    ),
                    
                  ),
                  Positioned(
                    left: (MediaQuery.of(context).size.width - 230) / 2,
                    top: 250,
                    child: Container(
                        width: 230,
                        height: 175,
                        color: Colors.blue,
                      ),
                  ),

                   Positioned(
                    right: 129.5, // Atur posisi x
                    top: 0, // Atur posisi y mendekati 0 (mepet di atas layar)
                    child: Container(
                      width: 100,
                      height: 190,
                      color: Colors.red,
            
                    ),
                    ),


                     Positioned(
                    left:472.5,// Atur posisi x
                    top: 0, // Atur posisi y mendekati 0 (mepet di atas layar)
                    child: Container(
                      width: 100,
                      height: 100,
                      color: const Color.fromARGB(255, 54, 244, 79),
            
                    ),
                    ),

                    Positioned(
                    left:300,// Atur posisi x
                    top: 0, // Atur posisi y mendekati 0 (mepet di atas layar)
                    child: Container(
                      width: 100,
                      height: 150,
                      color: Color.fromARGB(255, 244, 54, 158),
            
                    ),
                    ),

                    Positioned(
                    right:300,// Atur posisi x
                    top: 0, // Atur posisi y mendekati 0 (mepet di atas layar)
                    child: Container(
                      width: 100,
                      height: 150,
                      color: Color.fromARGB(255, 244, 54, 158),
            
                    ),
                    ),

                    Positioned(
                    top: 180, // Atur posisi y di atas container biru
                    width: MediaQuery.of(context).size.width, // Lebar text sesuai dengan lebar layar
                    child: Center(
                      child: Text(
                        'Judul Apk',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
