


float linearX, linearY, linearXSpeed;
float geometricX, geometricY, geometricXSpeed, geometricXAccel;
float exponentialX, exponentialY, exponentialXSpeed, exponentialXDir;

void setup() {
  size(640, 480); 
  linearX = 0;
  linearY = height/4;
  linearXSpeed = 1;

  geometricX = 1;
  geometricY = height/2;
  geometricXSpeed = 1;
  geometricXAccel = 1.01;


  exponentialX = 0;
  exponentialY = 3*height/4;
  exponentialXSpeed = 1.01;
  exponentialXDir = 1;
}

void draw() {
  background(0); 

  ////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////LINEAR MOTION/////////////////////////////////////////// 
  //////////////////////////////////////////////////////////////////////////////////////////

  if (linearX < 0 || linearX > width) 
    linearXSpeed *= -1;
    
  // With Linear Motion, you are moving the ball the same amount with each frame
  linearX += linearXSpeed;
  ellipse(linearX, linearY, 50, 50); 

  //////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////GEOMETRIC MOTION//////////////////////////////////////  
  /////////////////////////////////////////////////////////////////////////////////////////

  if (geometricX < 0 || geometricX > width)
    geometricXSpeed *= -1;

  // With Geometric Motion, you are moving the ball an increasing amount with each frame
  // by multiplying the speed
  geometricXSpeed *= geometricXAccel;
  geometricX += geometricXSpeed;
  ellipse(geometricX, geometricY, 50, 50);

  ///////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////EXPONENTIAL MOTION//////////////////////////////////////       
  ///////////////////////////////////////////////////////////////////////////////////////////

  if (exponentialX < 0 || exponentialX > width) 
    exponentialXDir *= -1; 
  // With Exponential Motion, you are moving the ball an increasing amount with each frame
  // by multiplying the speed by itself (or a fraction of itself) with each frame
  exponentialXSpeed = pow(exponentialXSpeed, 1.01);
  exponentialX += exponentialXSpeed*exponentialXDir;
  
  println(exponentialXSpeed);
  ellipse(exponentialX, exponentialY, 50, 50);
}

