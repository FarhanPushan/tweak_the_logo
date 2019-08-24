import processing.serial.*;
Serial myPort; 

PImage logo;

int bgcolor = 0;

void setup() {
  // put your setup code here, to run once:

  size(1, 1);
  surface.setResizable(true);
  colorMode(HSB, 255);
  logo = loadImage("http://arduino.cc/arduino_logo.png");
  surface.setSize(logo.width, logo.height);

  println("Available serial ports:");
  println(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
}
  
void draw() {
  // put your main code here, to run repeatedly:
  if(myPort.available()> 0){
    bgcolor = myPort.read();
    println(bgcolor);
  }

  background(bgcolor, 255, 255);
  image(logo, 0, 0);
}
