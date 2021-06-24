import 'dart:async';
import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String imagePath;
  DetailScreen(this.imagePath);

  @override
  _DetailScreenState createState() => _DetailScreenState(imagePath);
}

class _DetailScreenState extends State<DetailScreen> {
  _DetailScreenState(this.path);

  final String path;

  Size _imageSize;
  String recognizedText = "";
  List<String> recognizedTextBlocks = [];


  bool _checkValid(String text) { // Validation for Turkish license plate

    // Regexp for punctuation
    RegExp regPun = new RegExp(r'[^A-Za-z0-9().,;?]');

    // Regexp for Turkish license plate
    RegExp regExpTr = new RegExp(r'^(0[1-9]|[1-7][0-9]|8[01])((\s?[a-zA-Z]\s?)(\d{4,5})|(\s?[a-zA-Z]{2}\s?)(\d{3,4})|(\s?[a-zA-Z]{3}\s?)(\d{2,3}))$');

    text = text.replaceAll(regPun, ''); // Clearing any punctuations

    return regExpTr.hasMatch(text);
  }


  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    // Fetching image from path
    final Image image = Image.file(imageFile);

    // Retrieving its size
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }


  void _initializeVision() async {
    final File imageFile = File(path);

    if (imageFile != null) {
      await _getImageSize(imageFile);
    }

    final FirebaseVisionImage visionImage =
    FirebaseVisionImage.fromFile(imageFile);

    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);

    if (this.mounted) {
      setState(() {
        recognizedText = visionText.text;
        recognizedTextBlocks = [];

        print("-------------------------------");
        for (TextBlock block in visionText.blocks) {
          for (TextLine line in block.lines) {
            setState(() {
              _checkValid(line.text) ?
                recognizedTextBlocks.add(
                    line.text.replaceAll(RegExp(r'[^A-Za-z0-9().,;?]'), ' ')
                ) : print('');
              print(line.text);
            });
          }
        }
        print("-------------------------------");
        //print("LENGTH: ${recognizedTextBlocks.length}");
      });
    }
  }

  @override
  void initState() {
    _initializeVision();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Details"),
      ),
      body: _imageSize != null
          ? Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: double.maxFinite,
              color: Colors.black,
              child: AspectRatio(
                aspectRatio: _imageSize.aspectRatio,
                child: Image.file(
                  File(path),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 8,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        "License Plate",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 4,),
                    Container(
                      height: 60,
                      child: SingleChildScrollView(
                          child: recognizedTextBlocks.length > 0 ? Text(recognizedTextBlocks.join("\n")) : Text(''),
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: recognizedTextBlocks.length > 0 ?
                            Icon(Icons.check, color: Colors.green, size: 24.0,)
                                : Icon(Icons.warning, color: Colors.amber, size: 24.0,)
                        ),
                        Text(recognizedTextBlocks.length > 0 ? '${recognizedTextBlocks.length} license plate(s) detected.' : 'No plate detected.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
