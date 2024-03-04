import 'package:drawingai/app/data/drawCommand.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final List<DrawCommand> commands;

  MyPainter(this.commands);

  @override
  void paint(Canvas canvas, Size size) {
    print("paint method being called!");

    for (final command in commands) {
      final paint = Paint()
        ..color = command.color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = command.strokeWidth;

      if (command.points.length > 1) {
        for (int i = 0; i < command.points.length - 1; i++) {
          final start = command.points[i];
          final end = command.points[i + 1];
          print("Drawing line from $start to $end");

          canvas.drawLine(
            start,
            end,
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Always return true to repaint whenever there's a change in commands
    return true;
  }
}
