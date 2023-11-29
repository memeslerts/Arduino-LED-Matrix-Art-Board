// Processing code
import processing.serial.*;
Serial arduino;
int[][] matrix = new int[16][16];
int cellSize = 20;
final String serialName = "/dev/cu.usbserial-10";

void setup() {
  size(320, 320);
  arduino = new Serial(this, serialName, 115200);
}
void draw() {
  background(0);
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      if (matrix[i][j] == 1) fill(255);
      else fill(0);
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }
}
void mousePressed() {
  int x = mouseX/cellSize;
  int y = mouseY/cellSize;
  if (matrix[x][y] == 1) matrix[x][y] = 0;
  else matrix[x][y] = 1;
  arduino.write(x);
  arduino.write(y);
}
