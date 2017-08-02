PImage img;
//PImage fader;
boolean sketchFullScreen() {
  return true;
}
int cframe = 0;
int cdraw = 0;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;
int num = 50;
int x = 0;
int y = 0;
int z = 0;
int xp = 0;
int yp = 0;
int zp = 0;
int vel = 0;
int depth = 0;
int colcount = 0;
color[] colarray = {
  color(1, 198, 255),
  color(0, 255, 30),
  color(255, 60, 0),
  color(1, 255, 246),
  color(210, 255, 0),
  color(255, 186, 1),
  color(192, 1, 1255),
  color(255, 1, 150)
};
int col = color(colarray[(int) random(0, 7)]);
void setup() {
  img = loadImage("logo1.png");
  size(1366, 768);
  background(0);
  //fader = get();
  //background(0);
  noSmooth();
  noCursor();
  //smooth(4);
  frameRate(100);
  //frame.setResizable(true);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);
}
void draw() {
  //strokeWeight(0);
  //image(img, 0, 0);
  //image(img, 1170, 20, width/8, height/8);
  cframe++;
  if ((cframe % 44) == 0) {
    fill(0, 0, 0, 7);
    stroke(0);
    strokeWeight(0);
    rect(0, 0, width, height);
  }
  if ((cframe % 777) == 0) {
    fill(0, 0, 0, 33);
    stroke(0);
    strokeWeight(0);
    rect(0, 0, width, height);
  }
  /*  if ((cframe % 200) == 0){
      colcount++;
      col = color(colarray[colcount % 6]);
  */
  if (depth == 0) {
    colcount++;
    col = color(colarray[colcount % 8]);
  }
  // else {col = 255;}
  //fill(255);
  stroke(col, 255);
  if (vel <= 0) {
    //vel = 0;
    stroke(col, 0);
  }
  //vel=vel+2;
  strokeWeight(vel);
  // line(pmouseX,pmouseY,mouseX,mouseY);
  line(xp, yp, x, y);
  yp = y;
  xp = x;
  //blend(fader,0,0,width,height,0,0,width,height,SUBTRACT);
}
void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/leftY") == true) {
    if (theOscMessage.checkTypetag("i")) {
      int leftY = theOscMessage.get(0).intValue();
      println(" values: " + leftY);
      /*for(int i = num - 1 ; i > 0 ; i--)
           {
           x[i] = x[i-1];
           y[i] = y[i-1];
           }
       //[0] = leftX;*/
      //yp=y;
      y = leftY;
      //return;
    }
  }
  if (theOscMessage.checkAddrPattern("/leftX") == true) {
    if (theOscMessage.checkTypetag("i")) {
      int leftX = theOscMessage.get(0).intValue();
      println(" values: " + leftX);
      /* for(int i = num - 1 ; i > 0 ; i--)
          {
          x[i] = x[i-1];
          y[i] = y[i-1];
          }*/
      //xp=x;
      x = leftX;
      // y[0] = leftY;
      //return;
    }
  }
  if (theOscMessage.checkAddrPattern("/leftZ") == true) {
    if (theOscMessage.checkTypetag("i")) {
      int leftZ = theOscMessage.get(0).intValue();
      println(" values: " + leftZ);
      z = leftZ;
      //return;
    }
  }
  if (theOscMessage.checkAddrPattern("/rvel") == true) {
    if (theOscMessage.checkTypetag("i")) {
      int rvel = theOscMessage.get(0).intValue();
      println(" values: " + rvel);
      vel = rvel;
    }
  }
  if (theOscMessage.checkAddrPattern("/rvel") == true) {
    if (theOscMessage.checkTypetag("i")) {
      int rvel = theOscMessage.get(0).intValue();
      println(" values: " + rvel);
      vel = rvel;
      depth = rvel;
    }
  }
}
/*
void mouseMoved() {
  for(int i = num - 1 ; i > 0 ; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  //x[0] = mouseX;
  //y[0] = mouseY;
  x[0] = firstValue;
  y[0] = mouseY;
}
*/
