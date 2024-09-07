import 'package:flutter/cupertino.dart';

class CircleDiagonalLinePainter extends CustomPainter {
  final Color lineColor;
  final double lineWidth;

  CircleDiagonalLinePainter({
    this.lineColor = const Color(0xFFD0CDC8), // Default line color
    this.lineWidth = 1.0, // Default line thickness
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor // Line color
      ..strokeWidth = lineWidth; // Line thickness

    // Center of the circle
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 4;

    // Points defining the diagonal lines
    final topLeft = Offset(center.dx - radius, center.dy - radius);
    final topRight = Offset(center.dx + radius, center.dy - radius);
    final bottomLeft = Offset(center.dx - radius, center.dy + radius);
    final bottomRight = Offset(center.dx + radius, center.dy + radius);

    // Draw diagonal lines across the circle
    canvas.drawLine(topLeft, bottomRight, paint);
    canvas.drawLine(topRight, bottomLeft, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint
  }
}