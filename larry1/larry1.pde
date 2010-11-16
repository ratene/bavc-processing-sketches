
// charcter templiate

// setup
void setup()
{
  size(400,400);
  smooth();
  background(255,255,255); // background color
}


// draw loop
void draw()
{
  background(252,0,0);
  larry(); // draw character
}


// character function
void larry()
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


void mousePressed()
{
  println(mouseX + " " + mouseY);
}


// mouth
void mouth(int x, int y) {
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


void tooth(int x, int y, String row) {
  stroke(0);

  if (row.equals("bottom")) {
    fill(255);
    triangle(x, y+20, x+10, y, x+20, y+20);
  } 
  else if (row.equals("top")) {
    fill(255,255,0);
    triangle(x, y, x+10, y+20, x+20, y);
  }
}


//chin 
void chin(int x, int y) {
  arc(215, 350, 50, 100, 0, PI/1);
}

