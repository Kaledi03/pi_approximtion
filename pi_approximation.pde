import java.util.Random;

static final int POINT_N = 15000000;
static final int R=350;
int p_y = 0;
double pi;

void setup(){
  size(800, 800);
  stroke(255);
  noLoop();
}

void draw(){
  fill(200,200,200);
  stroke(0);
  square(50, 50, R*2);
  ellipse(height/2, width/2,R*2,R*2);
  
  Random random = new Random();
  
  for(int i=0; i<POINT_N; i++)
  {
    double x = random.nextDouble();
    double y = random.nextDouble();
    while(x>0.5){
      x = random.nextDouble();
    }
    x*=R*4;
    while(y>0.5){
      y = random.nextDouble();
    }
    y*=R*4;
    
    fill(255,0,0);
    if(inside_circle(x+50,y+50)){
      p_y++;
      fill(0,0,255);
    }
    ellipse((float)(x+50),(float)(y+50),1,1);
  }
  

  double r_squared = Math.pow(R, 2); // square area
  double circle_area = r_squared*((double)((100.0*p_y)/POINT_N))/100.0;
  pi=4.0*(circle_area/r_squared);
  String s = String.format("The approssimation of pi is: %.8g%n", pi);
  textSize(20);
  fill(0);
  text(s, 5,25);
}

boolean inside_circle(double x, double y){
  return dist((float)x,(float)y,width/2.0,height/2.0)<=(double)R;
}
