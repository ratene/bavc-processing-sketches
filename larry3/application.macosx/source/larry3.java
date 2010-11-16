import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class larry3 extends PApplet {

int numBlobs = 3;

int[] blogPx = { 0, 90, 90 };
int[] blogPy = { 0, 120, 45 };

// Movement vector for each blob
int[] blogDx = { 1, 1, 1 };
int[] blogDy = { 1, 1, 1 };

PGraphics pg;
int[][] vy,vx; 

// setup
public void setup()
{
  size(400,400);
  smooth();
  background(255,255,255); // background color
  pg = createGraphics(160, 90, P2D);    
  vy = new int[numBlobs][pg.height];
  vx = new int[numBlobs][pg.width];
}


// draw loop
public void draw()
{
  bg_effects();
  larry(); // draw character
}


// character function
public void larry()
{
  // draw character here 
  int x = width / 2;
  int y = height / 2;

  int eye_size = 55;
  int eye_spacing = 80;

  // center point
  // fill (255,0,0);
  // ellipse(x, y, 10, 10);

  // nose
  fill(80,36,10);
  ellipse(x - 10, y, 20, 55);
  ellipse(x + 10, y, 20, 55);
  noFill();




  // eyes
  ellipse(x - eye_spacing,  y - 140,  eye_size, eye_size);
  ellipse(x + eye_spacing,  y - 140,  eye_size, eye_size);

  // pupils
  fill(0,0,0);
  ellipse(x - eye_spacing,  y - 140,  eye_size / 2, eye_size);  
  ellipse(x + eye_spacing,  y - 140,  eye_size / 2, eye_size);    

  //eyebrows
  noFill();
  arc(x - eye_spacing, y - 140, 100, 100, TWO_PI - PI/2, TWO_PI );
  arc(x + eye_spacing, y - 140, 100, 100, TWO_PI - PI, TWO_PI-PI/2 );

  mouth(80, 300);


  noFill();
  chin(100,330);
}


// mouth
public void mouth(int x, int y) {
  pushMatrix();
  translate(x,y);
  rotate(radians(-25));
  stroke(0);
  noFill();

  if(mousePressed) { 
    rect(0, 0, 275,10);
  } 
  else {
    rect(0, 0, 275,75);

    for (int i = 0; i < 250; i += 20) {
      tooth(i+8, 0, "top");
    }  
    for (int i = 0; i < 250; i += 20) {
      tooth(i+8, 55, "bottom");
    }
  }




  popMatrix();
}


public void tooth(int x, int y, String row) {
  stroke(0);

  if (row.equals("bottom")) {
    fill(25,255,255);
    triangle(x, y+20, x+10, y, x+20, y+20);
  } 
  else if (row.equals("top")) {
    fill(15,255,255);
    triangle(x, y, x+10, y+20, x+20, y);
  }
}


//chin 
public void chin(int x, int y) {
  arc(215, 350, 50, 100, 0, PI/1);
}

public void bg_effects() {
    for (int i=0; i<numBlobs; ++i) {
    blogPx[i]+=blogDx[i];
    blogPy[i]+=blogDy[i];

    // bounce across screen
    if (blogPx[i] < 0) {
      blogDx[i] = 1;
    }
    if (blogPx[i] > pg.width) {
      blogDx[i] = -1;
    }
    if (blogPy[i] < 0) {
      blogDy[i] = 1;
    }
    if (blogPy[i] > pg.height) {
      blogDy[i]=-1;
    }

    for (int x = 0; x < pg.width; x++) {
      vx[i][x] = PApplet.parseInt(sq(blogPx[i]-x));
    }

    for (int y = 0; y < pg.height; y++) {
      vy[i][y] = PApplet.parseInt(sq(blogPy[i]-y)); 
    }
  }

  // Output into a buffered image for reuse
  pg.beginDraw();
  pg.loadPixels();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int m = 1;
      for (int i = 0; i < numBlobs; i++) {
        // Increase this number to make your blobs bigger
        m += 60000/(vy[i][y] + vx[i][x]+1);
      }
      pg.pixels[x+y*pg.width] = color(0, m+x, (x+m+y)/2);
    }
  }
  pg.updatePixels();
  pg.endDraw();

  // Display the results
  image(pg, 0, 0, width, height); 
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "larry3" });
  }
}
