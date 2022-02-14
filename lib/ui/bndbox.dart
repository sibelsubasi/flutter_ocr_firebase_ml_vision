import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:convert';
import '../clippers/front.dart';
import '../clippers/side_right.dart';

class BndBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;
  final String model;
  final String direction;

  BndBox(this.results, this.previewH, this.previewW, this.screenH, this.screenW,
      this.model, this.direction);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderBoxes() {
      return results.map((re) {
        /*print('****json****');
        print(jsonEncode(re));
        print('---> ${re["confidenceInClass"]}');
        print(re["confidenceInClass"] * 100 > 50
            ? '------------------------'
            : '');
        print(re["confidenceInClass"] * 100 > 50 ? 'OLDUUUUUUUUUUUUU' : '');
        print(re["confidenceInClass"] * 100 > 50
            ? '------------------------'
            : '');*/
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        var _manipulate = 0;
        if(direction == 'front'){
          _manipulate = 35;
        }if(direction == 'side-right'){
          _manipulate = 45;
        }

        return Positioned(
          left: math.max(0, x),
          top: math.max(0, y-(_manipulate)), // _manipulate ben ekledim..
          width: w,
          height: h,
          child: re['detectedClass'] == 'car'
              ? Container(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                  child: direction == 'front' ? CustomPaint(
                    size: Size(440,(440*0.8545454545454545).toDouble()),
                    painter: SideFrontCustomPainter(),
                  ):
                direction == 'side-right' ? CustomPaint(
                    size: Size(440,(440*0.45588235294117646).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: SideRightCustomPainter(),
                  ): null,
                )
                /*Container(
                  padding: EdgeInsets.only(top: 5.0, left: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                      width: 3.0,
                    ),
                  ),
                  child: Text(
                    "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )*/
              : Container(),
        );
      }).toList();
    }

    return Stack(
      children: _renderBoxes(),
    );
  }
}
