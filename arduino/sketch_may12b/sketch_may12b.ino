// Arduino code
#include <Adafruit_NeoPixel.h>
#define PIN 15
Adafruit_NeoPixel strip = Adafruit_NeoPixel(256, PIN, NEO_GRB + NEO_KHZ800);
int x, y;
void setup() {
  Serial.begin(115200);
  strip.begin();
  strip.show();
}
void loop() {
  if (Serial.available() > 1) {
    x = Serial.read();
    y = Serial.read();
    int i = y*16 + x;
    uint32_t c = strip.getPixelColor(i);
    if (c == strip.Color(0,0,0)) strip.setPixelColor(i, strip.Color(255,255,255));
    else strip.setPixelColor(i, strip.Color(0,0,0));
    strip.show();
  }
}
