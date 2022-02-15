import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class SideLeftCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9724138,size.height*0.7570356);
    path_0.cubicTo(size.width*0.9466844,size.height*0.8341463,size.width*0.9242706,size.height*0.7739212,size.width*0.8810345,size.height*0.8523452);
    path_0.cubicTo(size.width*0.8422414,size.height*0.9227017,size.width*0.8332228,size.height*0.9979362,size.width*0.7785809,size.height*0.9902439);
    path_0.cubicTo(size.width*0.7188992,size.height*0.9818011,size.width*0.7257294,size.height*0.8692308,size.width*0.6771220,size.height*0.8692308);
    path_0.cubicTo(size.width*0.4761936,size.height*0.8692308,size.width*0.3637931,size.height*0.8720450,size.width*0.3090849,size.height*0.8776735);
    path_0.cubicTo(size.width*0.2688329,size.height*0.8818011,size.width*0.2334881,size.height*0.9958724,size.width*0.1907162,size.height*0.9874296);
    path_0.cubicTo(size.width*0.1574271,size.height*0.9808630,size.width*0.1399867,size.height*0.9198874,size.width*0.1220822,size.height*0.8861163);
    path_0.cubicTo(size.width*0.07639257,size.height*0.8000000,size.width*0.03600796,size.height*0.8742964,size.width*0.01664456,size.height*0.7988743);
    path_0.cubicTo(size.width*-0.004244032,size.height*0.7172608,size.width*-0.001724138,size.height*0.5622889,size.width*0.03255968,size.height*0.4634146);
    path_0.cubicTo(size.width*0.08514589,size.height*0.3120075,size.width*0.1378647,size.height*0.3380863,size.width*0.2384615,size.height*0.2697936);
    path_0.cubicTo(size.width*0.3208223,size.height*0.2140713,size.width*0.3069629,size.height*0.1823640,size.width*0.3906499,size.height*0.09530957);
    path_0.cubicTo(size.width*0.4411141,size.height*0.04296435,size.width*0.5577586,size.height*-0.03414634,size.width*0.6900531,size.height*0.04465291);
    path_0.cubicTo(size.width*0.8294430,size.height*0.1277674,size.width*0.8889920,size.height*0.2388368,size.width*0.9466844,size.height*0.2472795);
    path_0.cubicTo(size.width*0.9915782,size.height*0.2538462,size.width*1.016910,size.height*0.6232645,size.width*0.9724138,size.height*0.7570356);
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