import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(size.width*0.2263636,size.height*0.0292553);
    path0.cubicTo(size.width*0.3026136,size.height*0.0029255,size.width*0.6971591,size.height*0.0029255,size.width*0.7595455,size.height*0.0281915);
    path0.cubicTo(size.width*0.8457955,size.height*0.1446809,size.width*0.8546591,size.height*0.2329787,size.width*0.8863636,size.height*0.3090426);
    path0.quadraticBezierTo(size.width*0.8962500,size.height*0.2591755,size.width*0.9113636,size.height*0.2606383);
    path0.quadraticBezierTo(size.width*0.9894318,size.height*0.2769947,size.width*0.9900000,size.height*0.3164894);
    path0.cubicTo(size.width*0.9812500,size.height*0.3340426,size.width*0.9637500,size.height*0.3585106,size.width*0.9113636,size.height*0.3781915);
    path0.quadraticBezierTo(size.width*0.9092045,size.height*0.3789894,size.width*0.9136364,size.height*0.4069149);
    path0.quadraticBezierTo(size.width*0.9511364,size.height*0.4727394,size.width*0.9636364,size.height*0.4946809);
    path0.quadraticBezierTo(size.width*0.9955682,size.height*0.6047872,size.width*0.9750000,size.height*0.9095745);
    path0.quadraticBezierTo(size.width*0.9620455,size.height*0.9655585,size.width*0.9431818,size.height*0.9813830);
    path0.cubicTo(size.width*0.9280682,size.height*0.9884309,size.width*0.9014773,size.height*0.9897606,size.width*0.8718182,size.height*0.9840426);
    path0.cubicTo(size.width*0.8595455,size.height*0.9683511,size.width*0.8440909,size.height*0.9412234,size.width*0.8409091,size.height*0.9021277);
    path0.cubicTo(size.width*0.7917045,size.height*0.8708777,size.width*0.2096591,size.height*0.8658245,size.width*0.1640909,size.height*0.9047872);
    path0.cubicTo(size.width*0.1531818,size.height*0.9481383,size.width*0.1386364,size.height*0.9752660,size.width*0.1204545,size.height*0.9867021);
    path0.cubicTo(size.width*0.0961364,size.height*0.9952128,size.width*0.0693182,size.height*0.9909574,size.width*0.0522727,size.height*0.9867021);
    path0.quadraticBezierTo(size.width*0.0297727,size.height*0.9631649,size.width*0.0204545,size.height*0.9095745);
    path0.quadraticBezierTo(size.width*0.0057955,size.height*0.6333777,size.width*0.0227273,size.height*0.5186170);
    path0.quadraticBezierTo(size.width*0.0369318,size.height*0.4893617,size.width*0.0795455,size.height*0.4015957);
    path0.quadraticBezierTo(size.width*0.0781818,size.height*0.3776596,size.width*0.0759091,size.height*0.3696809);
    path0.cubicTo(size.width*0.0397727,size.height*0.3562500,size.width*0.0175000,size.height*0.3341755,size.width*0.0059091,size.height*0.3159574);
    path0.quadraticBezierTo(size.width*0.0069318,size.height*0.2714096,size.width*0.0863636,size.height*0.2632979);
    path0.quadraticBezierTo(size.width*0.1070455,size.height*0.2671543,size.width*0.1163636,size.height*0.3159574);
    path0.cubicTo(size.width*0.1438636,size.height*0.2405585,size.width*0.1402273,size.height*0.1575798,size.width*0.2263636,size.height*0.0292553);
    path0.close();

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
