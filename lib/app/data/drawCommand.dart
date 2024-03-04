import 'dart:ui';

class DrawCommand {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  DrawCommand(this.points, this.color, this.strokeWidth);
}
