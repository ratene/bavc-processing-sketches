
// charcter templiate

// setup
void setup()
{
  size(400,400); 

  rectMode(CENTER);
  smooth();
}

// draw loop
void draw()
{
  background(255); // background color 
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

  noFill();

  // nose
  ellipse(x - 10, y, 20, 55);
  ellipse(x + 10, y, 20, 55);

  // eyes
  ellipse(x - eye_spacing,  y - 140,  eye_size, eye_size);
  ellipse(x + eye_spacing,  y - 140,  eye_size, eye_size);

  // pupils
  ellipse(x - eye_spacing,  y - 140,  eye_size / 2, eye_size);  
  ellipse(x + eye_spacing,  y - 140,  eye_size / 2, eye_size);    

  //eyebrows
  noFill();
  arc(x - eye_spacing, y - 140, 100, 100, TWO_PI - PI/2, TWO_PI );
  arc(x + eye_spacing, y - 140, 100, 100, TWO_PI - PI, TWO_PI-PI/2 );
  arc(x - eye_spacing, y - 140, 110, 100, TWO_PI - PI/2, TWO_PI );
  arc(x + eye_spacing, y - 140, 110, 100, TWO_PI - PI, TWO_PI-PI/2 );
  // glasses line


  mouth(x,y+90, 252, 80);
}


void mousePressed()
{
  println(mouseX + " " + mouseY);
}

// MOUTH

void mouth(int x, int y, int mouthwidth,int mouthheight) { 

  pushMatrix();
  translate(x, y);
  stroke(0);
  
  if(mousePressed){
  
  // open mouth
  rect(0,0,mouthwidth, mouthheight);
  int numteeth=12;
  int  toothheight=20;
  for(int i=0; i<numteeth; i++) { 
    rect((i*20)-mouthwidth/2+15, (mouthheight/2)-toothheight/2, mouthwidth/numteeth, toothheight);
  }
  for(int i=0; i<numteeth; i++) { 
    rect((i*20)-mouthwidth/2+15, -(mouthheight/2)+toothheight/2, mouthwidth/numteeth, toothheight);
  }
  
  } else {
     rect(0,0,mouthwidth, mouthheight);
    
  }


  popMatrix();
}


