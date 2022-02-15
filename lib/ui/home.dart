import 'package:flutter/material.dart';
import 'package:flutter_ocr_firebase/ui/camera_screen.dart';


class HomePage extends StatelessWidget {
  final ButtonStyle _style = ElevatedButton.styleFrom(
    textStyle: TextStyle(fontSize: 20),
    padding: EdgeInsets.all(15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Araç Tespit ve Plaka Tanıma'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                style: _style,
                child: Text('Ön Çekim'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen('front'),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: _style,
                child: Text('Arka Çekim'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen('back'),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: _style,
                child: Text('Sağ Yan Çekim'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen('side-right'),
                    ),
                  );
                },
              ),SizedBox(height: 30),
              ElevatedButton(
                style: _style,
                child: Text('Sol Yan Çekim'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen('side-left'),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      );
  }
}