import cc.arduino.*;
import processing.serial.*;

Arduino arduino;

int LEDR = 3;
int LEDG = 2;
int button = 7;
int pState = Arduino.LOW;
int angle = 0;
boolean push = false;
