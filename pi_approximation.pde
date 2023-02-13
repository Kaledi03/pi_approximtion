static final int POINT_N = 1000000;
static final int R=300;
int p_x = 0;
double pi;

void setup(){
  size(800, 800);
  stroke(255);
  noLoop();
}

void draw(){
  fill(200,200,200);
  stroke(0);
  square(100, 100, R*2);
  ellipse(height/2, width/2,R*2,R*2);
  
  for(int i=0; i<POINT_N; i++)
  {
    double x = Math.random()*(R*2+1);
    double y = Math.random()*(R*2+1);
    fill(255,0,0);
    if(!inside_circle(x+100,y+100)){
      p_x++;
      fill(0,0,255);
    }
    ellipse((float)(x+100),(float)(y+100),3,3);
  }
  

  double r_squared = Math.pow(R, 2); // square area
  print(r_squared);
  double circle_area = r_squared*((double)100-((double)((100.00*p_x)/POINT_N)))/100.0;
  pi=4.0*(circle_area/r_squared);
  String s = String.format("The approssimation of pi is: %1.10f", pi);
  textSize(20);
  fill(0);
  text(s, 5,25);
}

boolean inside_circle(double x, double y){
  return dist((float)x,(float)y,width/2.0,height/2.0)<=(double)R;
}
