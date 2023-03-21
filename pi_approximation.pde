import java.util.Random;

static final int TOTAL_NUMBER_OF_POINTS = 100000;
static final int SQUARE_LEANGTH_IN_PIXELS=400;
float border;
int numberOfPointsInTheCircle = 0;
double piApproximation;
float pointRadius = 1;
Random randomValues = new Random();
float centrePoint[] = new float[2];

void setup(){
  size(500, 500);
  stroke(0);
  textSize(30);
  fill(200,200,200);
  noLoop();
  border = (width-SQUARE_LEANGTH_IN_PIXELS)/2;
  centrePoint[0] = centrePoint[1] = width/2;
  drawBasicUI();
  noStroke();
}

void draw(){
  approximatePi();
}

void approximatePi()
{ 
  generateAndDrawRandomPoints();
  calculatePi();
  outputPiValue(); 
}


void drawBasicUI()
{
  square(border, border, SQUARE_LEANGTH_IN_PIXELS);
  ellipse(height/2, width/2,SQUARE_LEANGTH_IN_PIXELS,SQUARE_LEANGTH_IN_PIXELS);
}

void generateAndDrawRandomPoints()
{
  for(int i=0; i<TOTAL_NUMBER_OF_POINTS; i++)
  {
    double x = random(border, width-border);
    double y = random(border, height-border);
    checkAndDrawThePoint(x,y);
  }
}

void checkAndDrawThePoint(double x, double y)
{
  checkThePoint(x,y);
  drawThePoint(x,y);
}

void checkThePoint(double x, double y){
  fill(255,0,0);
  if(isThePointInTheCircle(x,y)){
      numberOfPointsInTheCircle++;
      fill(0,0,255);
  }
}


boolean isThePointInTheCircle(double x, double y){
  return dist((float)x,(float)y,centrePoint[0],centrePoint[1]) <= (double)SQUARE_LEANGTH_IN_PIXELS/2;
}

void drawThePoint(double x, double y)
{
  ellipse((float)(x),(float)(y),pointRadius,pointRadius);
}


void calculatePi()
{
  double squareArea = Math.pow(SQUARE_LEANGTH_IN_PIXELS, 2);
  double circle_area = squareArea*((double)(numberOfPointsInTheCircle)/TOTAL_NUMBER_OF_POINTS);
  piApproximation=4.0*(circle_area/squareArea);
}


void outputPiValue()
{
  String s = String.format("Pi ≈ %g", piApproximation);
  print(s);
  fill(0);
  textAlign(CENTER, CENTER);
  text(s, centrePoint[0],centrePoint[1]);
}
