import 'dart:math';

List<Point<int>> midpointCircle(int xc, int yc, int radius) {
  List<Point<int>> points = [];

  int x = radius;
  int y = 0;
  int p = 1 - radius;

  while (x >= y) {
    points.addAll(_getSymmetricPoints(xc, yc, x, y));
    y++;

    if (p <= 0) {
      p += 2 * y + 1;
    } else {
      x--;
      p += 2 * (y - x) + 1;
    }
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
