import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color color;
  final double opacity;
  final bool isLeftAligned;

  WavePainter({required this.color, this.opacity = 1.0, required this.isLeftAligned});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height * 0.75);

    if (isLeftAligned) {
      var firstControlPoint = Offset(size.width / 4, size.height * 0.5);
      var firstEndPoint = Offset(size.width / 2, size.height * 0.75);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width * 3 / 4, size.height);
      var secondEndPoint = Offset(size.width, size.height * 0.75);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    } else {
      var firstControlPoint = Offset(size.width / 4, size.height);
      var firstEndPoint = Offset(size.width / 2, size.height * 0.75);
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

      var secondControlPoint = Offset(size.width * 3 / 4, size.height * 0.5);
      var secondEndPoint = Offset(size.width, size.height * 0.75);
      path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
