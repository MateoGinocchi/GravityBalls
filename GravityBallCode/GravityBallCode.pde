//declare variables
//float x, y, velX, velY, diam, a;
int c = 30;
float[] x = new float[c];
float[] y = new float[c];
float[] velX = new float[c];
float[] velY = new float[c];
float[] a = new float[c];
float[] diam = new float[c];
void setup() {
  //set size of canvas
  size(800, 600);

  for(int i = 0; i < c; i++) {//initialize variables
  x[i] = random(width);
  y[i] = random(0,height/2);
  diam[i] = 15;
  velX[i] = 0 ;
  velY[i] = 0;
  a[i] = .1;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for(int j = 0; j<c; j++) {
    //draw ball
    ellipse(x[j], y[j], diam[j], diam[j]);

    //add velocity to position
    x[j] += velX[j];
    y[j] += velY[j];
    //add acceleration to velocity
    velY[j] += a[j];

    //bounce ball if it hits walls
    if (x[j] + diam[j]/2 >= width) {
        velX[j] = -abs(velX[j]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    }  else if (x[j] - diam[j]/2 <= 0) {
        velX[j] = abs(velX[j]);     //if the ball hits the left wall, assign x velocity the positive version of itself
      }
    if (y[j] + diam[j]/2 >= height) {
      velY[j] = -abs(velY[j]);
    } else if (y[j] - diam[j]/2 <= 0) {
      velY[j] = abs(velY[j]);
      }
  }
}