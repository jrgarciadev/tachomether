
/**
 * Tacometro en RPM, recibe los datos del puerto serial de Arduino UNO
 * el circuito ese basa en el Sensor de efecto Hall
 * @author Junior Garcia <jrgarciadev@gmail.com>
 */

PImage gauge_img, needle_img;

final static float NEEDLE_CENTER_X = 276;
final static float NEEDLE_CENTER_Y = 8;
float needle_trsn_x;
float needle_trsn_y; 
float needle_x;
float needle_y;
//Sensor value
float value = 0;

void setup() {
  size(640, 452);
  gauge_img = loadImage("resources/gauge.png");
  needle_img = loadImage("resources/needle.png");
  needle_x = needle_img.width / 2;
  needle_y = needle_img.height * 0.89;
  needle_trsn_x = NEEDLE_CENTER_X + needle_x;
  needle_trsn_y = NEEDLE_CENTER_Y + needle_y;
}

void draw() {
  background(gauge_img);
  //pushMatrix();
  translate(needle_trsn_x, needle_trsn_y );
  rotate(value);
  translate(-needle_x, -needle_y);
  image(needle_img, 0, 0);
  //popMatrix();
  value = value + 0.02;
}
