import 'dart:math';

List<Point<int>> midpointCircle(int xc, int yc, int radius) {
  List<Point<int>> points = [];

  int x = 0;
  int y = radius;
  int p = 1 - radius;

  while (x < y) {
    points.addAll(_getSymmetricPoints(xc, yc, x, y));
    x++;

    if (p <= 0) {
      p += 2 * x + 1;
    } else {
      y--;
      p += 2 * (x - y) + 1;
    }
  }
  return points;
}

List<Point<int>> _getSymmetricPoints(int xc, int yc, int x, int y) {
  // this is to get the equivalent point of this x and y on the other octants
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
