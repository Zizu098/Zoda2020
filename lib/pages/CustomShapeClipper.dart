import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndpoint = Offset(size.width * 0.5, size.height - 35.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndpoint.dx, firstEndpoint.dy);

    var secondEndpoint = Offset(size.width, size.height - 80.0);
    var secondControlpoint = Offset(size.width * 0.75, size.height - 10.0);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy,
        secondEndpoint.dx, secondEndpoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
