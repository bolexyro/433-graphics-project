
import 'dart:math';

List<Point<int>> midpointLine(int x0, int y0, int x1, int y1) {
  List<Point<int>> points = [];

  int dx = x1 - x0;
  int dy = y1 - y0;
  int x = x0, y = y0;
  
  int d = 2 * dy - dx;
  int dd = 2 * (dy - dx);

  points.add(Point(x, y));

  while (x < x1) {
    x++;
    if (d < 0) {
      d = d + 2 * dy;
    } else {
      d = d + dd;
      y++;
    }
    points.add(Point(x, y));
  }
  return points;
}
