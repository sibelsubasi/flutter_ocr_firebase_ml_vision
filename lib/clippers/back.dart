import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class SideBackCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.01107595,size.height*0.5287356);
    path_0.cubicTo(size.width*0.01297468,size.height*0.4720307,size.width*0.03069620,size.height*0.4549808,size.width*0.06329114,size.height*0.3908046);
    path_0.cubicTo(size.width*0.08655063,size.height*0.3450192,size.width*0.09873418,size.height*0.3461686,size.width*0.1191456,size.height*0.2984674);
    path_0.cubicTo(size.width*0.1666139,size.height*0.1873563,size.width*0.1514241,size.height*0.1524904,size.width*0.2136076,size.height*0.05747126);
    path_0.cubicTo(size.width*0.2314873,size.height*0.03026820,size.width*0.3474684,size.height*0.01264368,size.width*0.4908228,size.height*0.01111111);
    path_0.cubicTo(size.width*0.6314873,size.height*0.009578544,size.width*0.7488924,size.height*0.01111111,size.width*0.7816456,size.height*0.04980843);
    path_0.cubicTo(size.width*0.8560127,size.height*0.1375479,size.width*0.8189873,size.height*0.1883142,size.width*0.8813291,size.height*0.3084291);
    path_0.cubicTo(size.width*0.9224684,size.height*0.3877395,size.width*0.9466772,size.height*0.3852490,size.width*0.9762658,size.height*0.4578544);
    path_0.cubicTo(size.width*0.9988924,size.height*0.5130268,size.width*0.9909810,size.height*0.5475096,size.width*0.9889241,size.height*0.6360153);
    path_0.cubicTo(size.width*0.9859177,size.height*0.7680077,size.width*0.9860759,size.height*0.7984674,size.width*0.9810127,size.height*0.9003831);
    path_0.cubicTo(size.width*0.9787975,size.height*0.9431034,size.width*0.9775316,size.height*0.9528736,size.width*0.9498418,size.height*0.9727969);
    path_0.cubicTo(size.width*0.9185127,size.height*0.9952107,size.width*0.8886076,size.height*0.9919540,size.width*0.8533228,size.height*0.9747126);
    path_0.cubicTo(size.width*0.8215190,size.height*0.9591954,size.width*0.8248418,size.height*0.9172414,size.width*0.8053797,size.height*0.9157088);
    path_0.cubicTo(size.width*0.5140823,size.height*0.8927203,size.width*0.4591772,size.height*0.9000000,size.width*0.2045886,size.height*0.9153257);
    path_0.cubicTo(size.width*0.1674051,size.height*0.9176245,size.width*0.1723101,size.height*0.9676245,size.width*0.1333861,size.height*0.9823755);
    path_0.cubicTo(size.width*0.08955696,size.height*0.9990421,size.width*0.05759494,size.height*1.000383,size.width*0.03481013,size.height*0.9616858);
    path_0.cubicTo(size.width*0.009968354,size.height*0.9191571,size.width*0.008386076,size.height*0.6145594,size.width*0.01107595,size.height*0.5287356);
    path_0.close();

    Paint paint_0_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=4;
    paint_0_stroke.color=Color(0xff2193f3).withOpacity(1.0);
    paint_0_stroke.strokeCap = StrokeCap.round;
    paint_0_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0,paint_0_stroke);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}