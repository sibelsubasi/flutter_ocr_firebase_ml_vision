import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class SideRightCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;


    Path path0 = Path();
    path0.moveTo(size.width*0.1452941,size.height*0.0651613);
    path0.cubicTo(size.width*0.3249265,size.height*-0.0372581,size.width*0.5108088,size.height*0.0291935,size.width*0.5573529,size.height*0.0619355);
    path0.cubicTo(size.width*0.5974265,size.height*0.1159677,size.width*0.6869853,size.height*0.2885484,size.width*0.7176471,size.height*0.2780645);
    path0.cubicTo(size.width*0.8983824,size.height*0.3450000,size.width*0.9280882,size.height*0.4143548,size.width*0.9652941,size.height*0.4606452);
    path0.quadraticBezierTo(size.width*1.0259559,size.height*0.6203226,size.width*0.9691176,size.height*0.7638710);
    path0.quadraticBezierTo(size.width*0.9327941,size.height*0.8451613,size.width*0.8579412,size.height*0.8774194);
    path0.cubicTo(size.width*0.8385294,size.height*0.8595161,size.width*0.8335294,size.height*0.9746774,size.width*0.7779412,size.height*0.9941935);
    path0.quadraticBezierTo(size.width*0.7050735,size.height*0.9953226,size.width*0.6864706,size.height*0.8619355);
    path0.lineTo(size.width*0.2794118,size.height*0.8490323);
    path0.quadraticBezierTo(size.width*0.2486765,size.height*0.9916129,size.width*0.1882353,size.height*0.9909677);
    path0.cubicTo(size.width*0.1116176,size.height*0.9950000,size.width*0.1242647,size.height*0.8198387,size.width*0.0582353,size.height*0.7851613);
    path0.quadraticBezierTo(size.width*-0.0139706,size.height*0.6682258,size.width*0.0105882,size.height*0.3974194);
    path0.quadraticBezierTo(size.width*0.0686765,size.height*0.1350000,size.width*0.1452941,size.height*0.0651613);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
