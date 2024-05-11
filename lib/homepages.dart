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
          return MyHomePage();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double leftValue = 25; // Nilai awal left untuk animasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Container amber
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.amber,
            ),
            // Container merah di tengah
            Positioned(
              left: 0, // Pinggir kiri container amber
              right: 0, // Pinggir kanan container amber
              top: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5, // Setengah tinggi layar
                color: Colors.red,
              ),
            ),
            // Container putih di bawah container merah dengan padding
            Positioned(
              left: 70, // Padding kiri
              right: 70, // Padding kanan
              top: 200, // Atur posisi y mendekati 0 (mepet di atas layar)
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), // Melengkungkan sudut kiri atas
                  topRight: Radius.circular(10), // Melengkungkan sudut kanan atas
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1,
                  color: Colors.white,
                  child: GestureDetector(
                    // Menggunakan GestureDetector untuk mendeteksi gerakan jari pengguna
                    onPanUpdate: (details) {
                      setState(() {
                        // Menggeser kontainer biru sesuai perubahan posisi jari pengguna
                        leftValue += details.delta.dx;
                      });
                    },
                    child: Stack(
                      children: [
                        // Container biru di dalam container hitam
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 0), // Tidak ada animasi saat geser
                          left: leftValue, // Gunakan nilai left yang diperbarui
                          top: 25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10), // Atur border radius
                            child: Container(
                              width: 200,
                              height: 120,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        // Tambahkan kontainer biru lainnya
                        for (int i = 1; i <= 6; i++)
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 0), // Tidak ada animasi saat geser
                            left: leftValue + i * 235, // Geser kontainer biru berikutnya
                            top: 25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Atur border radius
                              child: Container(
                                width: 200,
                                height: 120,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 70, // Atur posisi x
              top: 146, // Atur posisi y mendekati 0 (mepet di atas layar)
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), // Melengkungkan sudut kiri atas
                  topRight: Radius.circular(10), // Melengkungkan sudut kanan atas
                ),
                child: Container(
                  width: 125,
                  height: 69,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 204, // Atur posisi x
              top: 146, // Atur posisi y mendekati 0 (mepet di atas layar)
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), // Melengkungkan sudut kiri atas
                  topRight: Radius.circular(10), // Melengkungkan sudut kanan atas
                ),
                child: Container(
                  width: 69,
                  height: 69,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
