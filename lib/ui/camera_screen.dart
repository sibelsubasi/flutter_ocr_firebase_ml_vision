import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';

import 'detail_screen.dart';
import 'bndbox.dart';

const String _model = "SSDMobileNet";

class CameraScreen extends StatefulWidget {
  final String direction;
  CameraScreen(this.direction);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _controller;
  bool _isDetected = false;
  bool _isLoading = false;
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  @override
  void initState() {
    super.initState();
    loadModel();
    initializeCamera();
  }

  loadModel() async {
    String res = await Tflite.loadModel(
        model: "assets/ssd_mobilenet.tflite",
        labels: "assets/ssd_mobilenet.txt");
  }

  initializeCamera() async{
    List<CameraDescription> _cameras = await availableCameras();
    _controller = new CameraController(
      _cameras[0],
      ResolutionPreset.high, //medium
      enableAudio: false,
    );
    _controller.initialize().then((_) async {
      if (!mounted) {
        return;
      }

      await startImageStream();
      setState(() {});
    });
  }

  startImageStream() async {
    await _controller.startImageStream((CameraImage img) {
      if (!_isDetected) {
        _isDetected = true;

        int startTime = new DateTime.now().millisecondsSinceEpoch;

        Tflite.detectObjectOnFrame(
          bytesList: img.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          model: _model, //"SSDMobileNet",
          imageHeight: img.height,
          imageWidth: img.width,
          imageMean: 127.5,
          imageStd: 127.5,
          numResultsPerClass: 1,
          threshold: 0.4,
        ).then((recognitions) {
          int endTime = new DateTime.now().millisecondsSinceEpoch;
          print("Detection took ${endTime - startTime}");

          setRecognitions(recognitions, img.height, img.width);

          _isDetected = false;
        });
      }
    });
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  _takePicture(context) async {

    setState(() {
      _isLoading = true;
    });

    // Checking whether the controller is initialized
    if (_controller == null || !_controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    // Formatting Date and Time
    String dateTime = DateFormat.yMMMd()
        .addPattern('-')
        .add_Hms()
        .format(DateTime.now())
        .toString();

    String formattedDateTime = dateTime.replaceAll(' ', '');
    print("Formatted: $formattedDateTime");

    // Retrieving the path for saving an image
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String visionDir = '${appDocDir.path}/Photos/Vision\ Images';
    await Directory(visionDir).create(recursive: true);
    final String imagePath = '$visionDir/image_$formattedDateTime.jpg';

    // Checking whether the picture is being taken
    // to prevent execution of the function again
    // if previous execution has not ended
    if (_controller.value.isTakingPicture) {
      print("Processing is in progress...");
      return null;
    }

    try {
      _controller.stopImageStream(); // Need to avoid controller exception while capturing image!! Olmazsa olmaz.
      _isDetected = false;

      sleep(const Duration(seconds: 1));

      await _controller.takePicture(imagePath);
      await startImageStream();
      _isLoading = false;

      if (imagePath != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(imagePath),
          ),
        );
      }

    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }

    //return imagePath;
  }

  isCarDetected(){
    if (_recognitions == null) _recognitions = [];
    return _recognitions.indexWhere((element) => element['detectedClass'] == 'car');
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    }

    var tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = _controller.value.previewSize;
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;

    Size screen = MediaQuery.of(context).size;

//    print("~~~~ RECOGNITION RES: ");
//    print(jsonEncode(_recognitions));

    return Scaffold(
      appBar: AppBar(
        title: Text('Araç Tespit ve Plaka Tanıma'),
      ),
      body: _controller.value.isInitialized && !_isLoading
          ? Stack(
              children: <Widget>[
                OverflowBox(
                  maxHeight:
                  screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
                  maxWidth:
                  screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
                  child: CameraPreview(_controller),
                ),
                BndBox(
                    _recognitions == null ? [] : _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model,
                    widget.direction
                ),

                /*Center(
                    child: Container(
                  margin: EdgeInsets.all(20.0),
                  //height: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15.0)),
                )),*/
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.fromLTRB(65, 0, 65, 0),
                    child: isCarDetected() > -1
                        ? FloatingActionButton(
                            child: Icon(Icons.camera_alt),
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              _takePicture(context);

//                              await _takePicture().then((String path) {
//                                if (path != null) {
//                                  Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => DetailScreen(path),
//                                    ),
//                                  );
//                                }
//                              });

                            },
                          )
                        : Text(""),
                  ),
                )
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
