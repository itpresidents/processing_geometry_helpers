

float constantX, constantY, constantXSpeed;
float linearX, linearY, linearXSpeed;
float geometricX, geometricY, geometricXSpeed, geometricXAccel;
float exponentialX, exponentialY, exponentialXSpeed, exponentialXDir;

void setup() {
  size(640, 650); 

  constantX = 0;
  constantY = 100;
  constantXSpeed = 1;

  linearX = 0;
  linearY = 250;
  linearXSpeed = 1;

  geometricX = 1;
  geometricY = 400;
  geometricXSpeed = 1;
  geometricXAccel = 1.01;


  exponentialX = 0;
  exponentialY = 550;
  exponentialXSpeed = 1.01;
  exponentialXDir = 1;
}

void draw() {
  background(0); 

  ////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////CONSTANT MOTION/////////////////////////////////////////// 
  //////////////////////////////////////////////////////////////////////////////////////////

  if (constantX < 0 || constantX > width) 
    constantXSpeed *= -1;

  // With constant Motion, you are moving the ball the same amount with each frame
  constantX += constantXSpeed;
  ellipse(constantX, constantY, 50, 50); 

  ////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////LINEAR MOTION/////////////////////////////////////////// 
  //////////////////////////////////////////////////////////////////////////////////////////

  if (linearX < 0 || linearX > width) 
    linearXSpeed *= -1;

  if (linearXSpeed > 0)  
    linearXSpeed++; 
  else
    linearXSpeed--; 

  // With Linear Motion, you are moving the ball the same amount faster with each frame
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

  ellipse(exponentialX, exponentialY, 50, 50);
}

