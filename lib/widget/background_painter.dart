import 'dart:ui';

import 'package:flutter/material.dart';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class BackgroundPainter extends CustomPainter {
  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  BackgroundPainter()
      : bluePaint = Paint()
          ..color = Colors.lightBlue.shade300
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = Colors.blueGrey[900]
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          ..color = Colors.orange.shade400
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    paintBlue(size, canvas);
    paintDark(size, canvas);
    paintOrange(size, canvas);
  }

  void paintBlue(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, 0);

    _addPointsToPath(path, [
      Point(
        size.width * 0.35,
        size.height * 0.35,
      ),
      Point(
        size.width,
        size.height * 0.6,
      ),
      Point(
        size.width,
        size.height * 0.55,
      ),
    ]);

    canvas.drawPath(path, bluePaint);
  }

  void paintDark(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.48);

    _addPointsToPath(
      path,
      [
        Point(
          size.width * 0.5,
          size.height * 0.65,
        ),
        Point(
          size.width * 0.7,
          size.height * 0.2,
        ),
        Point(
          size.width,
          size.height * 0.15,
        ),
      ],
    );

    canvas.drawPath(path, greyPaint);
  }

  void paintOrange(Size size, Canvas canvas) {
    final path = Path();

    path.moveTo(size.width * 0.75, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.2);

    _addPointsToPath(path, [
      Point(
        size.width * 0.2,
        size.height * 0.25,
      ),
      Point(
        size.width * 0.35,
        size.height * 0.1,
      ),
      Point(
        size.width * 0.65,
        size.height * 0.06,
      ),
      Point(
        size.width * 0.75,
        0,
      ),
    ]);

    canvas.drawPath(path, orangePaint);
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need 3+ points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xDiff = (points[i].x + points[i + 1].x) / 2;
      final yDiff = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xDiff, yDiff);
    }

    final secondLastPoint = points[points.length - 2];
    final lastPoint = points[points.length - 1];
    path.quadraticBezierTo(
        secondLastPoint.x, secondLastPoint.y, lastPoint.x, lastPoint.y);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
