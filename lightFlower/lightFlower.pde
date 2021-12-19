void setup() {
  size (500, 500);
  randomSeed(second());
  noStroke();

  println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbserial-1420", 57600);
  arduino.pinMode(button, Arduino.INPUT);
}

void draw() {
  int state = arduino.digitalRead(button);
  int light = arduino.analogRead(0);

  if (pState == Arduino.LOW && state == Arduino.HIGH)
  {
    push =! push ;
  }

  pState = state;

  if (push==true)
  {
    arduino.digitalWrite(LEDR, 0);
    arduino.digitalWrite(LEDG, 1);

    float l = map(light, 0, 1023, 0, 255);
    fill(255, 255, 255-l);

    if (mousePressed)
      flower();
  } else
  {
    arduino.digitalWrite(LEDR, 1);
    arduino.digitalWrite(LEDG, 0);
    clear();
    background(34, 116, 28);
  }
}

void flower()
{
  angle += 5;
  float val = cos(radians(angle)) * 12.0;
  for (int a = 0; a < 360; a += 75) {
    float xoff = cos(radians(a)) * val;
    float yoff = sin(radians(a)) * val;
    ellipse(mouseX + xoff, mouseY + yoff, val, val);
  }
  fill(255);
  ellipse(mouseX, mouseY, 2, 2);
}
