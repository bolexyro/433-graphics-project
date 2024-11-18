
import 'dart:math';

List<Point<int>> bresenhamCircle(int xc, int yc, int radius) {
  List<Point<int>> points = [];

  int x = 0;
  int y = radius;
  int d = 3 - 2 * radius;

  while (x <= y) {
    points.addAll(_getSymmetricPoints(xc, yc, x, y));
    if (d < 0) {
      d += 4 * x + 6;
    } else {
      d += 4 * (x - y) + 10;
      y--;
    }
    x++;
  }

  return points;
}

List<Point<int>> _getSymmetricPoints(int xc, int yc, int x, int y) {
  return [
    Point(xc + x, yc + y),
    Point(xc - x, yc + y),
    Point(xc + x, yc - y),
    Point(xc - x, yc - y),
    Point(xc + y, yc + x),
    Point(xc - y, yc + x),
    Point(xc + y, yc - x),
    Point(xc - y, yc - x),
  ];
}
