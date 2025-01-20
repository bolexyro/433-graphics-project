
import 'dart:math';

List<Point<int>> bresenhamLine(int x0, int y0, int x1, int y1) {
  List<Point<int>> points = [];

  int dx = (x1 - x0).abs();
  int dy = (y1 - y0).abs();
  int p = 2 * dy - dx;

  while (true) {
    points.add(Point(x0, y0));
    if (x0 == x1 && y0 == y1) break;
    if (p < 0){
      x0 += 1;
      p += 2 * dy;
    }
    else{
      x0 += 1;
      y0 += 1;
      p += 2 * dy - 2 * dx;
    }

  }

  return points;
}
