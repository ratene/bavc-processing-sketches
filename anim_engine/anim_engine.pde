

import processing.video.*;
Capture myCapture;

PImage[] frames;

void setup() 
{
  size(640, 480);

//  myCapture = new Capture(this, width, height, 30);

  frames = new PImage[5];
  for (int i = 0; i < 5; i++) {
     frames[i] =  loadImage("scene1/frame-" + i + ".jpg");   
  }  
  
}

/*
void captureEvent(Capture myCapture) {
  myCapture.read();
}
*/


void draw() {
//  image(myCapture, 0, 0);

  int currentImage = int(map(mouseX, 0, width, 0, frames.length-1));

  image(frames[currentImage], 0, 0);

}


//int frameNumber = 0;
void keyPressed() {
  /*
  if( key=='s') {
    println("framesaved");
    saveFrame("frame-" + frameNumber + ".jpg");
    frameNumber++;
  }
  */
}

