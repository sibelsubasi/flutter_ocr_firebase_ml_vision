import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class SideRightCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.05331565,size.height*0.2472795);
    path_0.cubicTo(size.width*0.1110080,size.height*0.2388368,size.width*0.1705570,size.height*0.1277674,size.width*0.3099469,size.height*0.04465291);
    path_0.cubicTo(size.width*0.4422414,size.height*-0.03414634,size.width*0.5588859,size.height*0.04296435,size.width*0.6093501,size.height*0.09530957);
    path_0.cubicTo(size.width*0.6930371,size.height*0.1823640,size.width*0.6791777,size.height*0.2140713,size.width*0.7615385,size.height*0.2697936);
    path_0.cubicTo(size.width*0.8621353,size.height*0.3380863,size.width*0.9148541,size.height*0.3120075,size.width*0.9674403,size.height*0.4634146);
    path_0.cubicTo(size.width*1.001724,size.height*0.5622889,size.width*1.004244,size.height*0.7172608,size.width*0.9833554,size.height*0.7988743);
    path_0.cubicTo(size.width*0.9639920,size.height*0.8742964,size.width*0.9236074,size.height*0.8000000,size.width*0.8779178,size.height*0.8861163);
    path_0.cubicTo(size.width*0.8600133,size.height*0.9198874,size.width*0.8425729,size.height*0.9808630,size.width*0.8092838,size.height*0.9874296);
    path_0.cubicTo(size.width*0.7665119,size.height*0.9958724,size.width*0.7311671,size.height*0.8818011,size.width*0.6909151,size.height*0.8776735);
    path_0.cubicTo(size.width*0.6362069,size.height*0.8720450,size.width*0.5238064,size.height*0.8692308,size.width*0.3228780,size.height*0.8692308);
    path_0.cubicTo(size.width*0.2742706,size.height*0.8692308,size.width*0.2811008,size.height*0.9818011,size.width*0.2214191,size.height*0.9902439);
    path_0.cubicTo(size.width*0.1667772,size.height*0.9979362,size.width*0.1577586,size.height*0.9227017,size.width*0.1189655,size.height*0.8523452);
    path_0.cubicTo(size.width*0.07572944,size.height*0.7739212,size.width*0.05331565,size.height*0.8341463,size.width*0.02758621,size.height*0.7570356);
    path_0.cubicTo(size.width*-0.01690981,size.height*0.6232645,size.width*0.008421751,size.height*0.2538462,size.width*0.05331565,size.height*0.2472795);
    path_0.close();

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=4;
    paint_0_stroke.color=Color(0x2193f3).withOpacity(1.0);
    paint_0_stroke.strokeCap = StrokeCap.round;
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0,paint_0_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*class SideRightCustomPainter extends CustomPainter{

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

}*/
