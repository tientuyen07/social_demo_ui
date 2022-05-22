import 'package:flutter/material.dart';

class CurveClipperProfile extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 4 * size.height / 5);
    Offset centerPoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        centerPoint.dx, centerPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(endPoint.dx, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
