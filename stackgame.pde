import processing.serial.*;
float[] x; // horizontal direction of rectangle
float[] y; // vertical direction of rectangle
float w; // lenght of rectangle
float h; // width of rectangle
float yspeed;// vertical speed of rectangle
float H1; // height of the screen
boolean going= true;
int[] squares;
int click=0;
int initQuick=300;
int quick=300;

void setup() {
  size(1280, 720);
  surface.setTitle("Stack Game");
  surface.setResizable(false);
  H1= height;
  w = 90;
  h = 90;
  yspeed=90;
  x=new float[14];
  y=new float[14];
  squares=new int[14];
  for(int i=0;i<14;i++)
  {
    x[i]=i*90;
    y[i]=0;
    squares[i]=4;
  }
  
}



void draw() {
  background(240);
  stroke(0,0,0);
  fill(255, 147, 79); 
  for(int i=0;i<=height;i+=90)
  {
    line(0,i,width,i);
  }
  for(int i=0;i<=width;i+=90)
  {
    line(i,0,i,width);
  }

  if ((y[click] > height-(h+1)*squares[click] && yspeed>0 )|| (y[click]<h&& yspeed<0 )){
    yspeed= yspeed * (-1);
  }
  for(int i=0;i<click;i++)
  {
    for(int j=squares[i]-1;j>=0;j--)
    {
      rect(x[i], y[i]+j*h, w, h);
    }
  }
  for(int i=squares[click]-1;i>=0;i--)
  {
      // color of rectangle
      rect(x[click], y[click]+i*h, w, h);
      if (going&&i==0) {
        y[click]=y[click] + yspeed;
      }
  }
  delay(quick);
 
}
//using space bar to start or stop
void keyPressed() {
  if (keyCode ==' ') {
    if(click==13)
    {
       click=0;
       for(int i=0;i<14;i++)
        {
          x[i]=i*90;
          y[i]=0;
          squares[i]=4;
          quick=initQuick;
        }
    }
    else{
    y[click]-=yspeed;
    if(click==0)
    {
      y[click+1]=y[click];
      squares[click+1]=squares[click];
    }
    else
    {
      if(y[click]<y[click-1])
      {
        squares[click]=(int)(squares[click-1]-((y[click-1]-y[click])/90));
        y[click]=y[click-1];
        y[click+1]=y[click];
        squares[click+1]=squares[click];
        if(squares[click]<=0)
        {
           click=0;
           for(int i=0;i<14;i++)
            {
              x[i]=i*90;
              y[i]=0;
              squares[i]=4;
              quick=initQuick;
            }
            return;
        }
        
      }
      else if(y[click]>y[click-1])
      {
        squares[click]=(int)(squares[click-1]-((y[click]-y[click-1])/90));
        y[click+1]=y[click];
        squares[click+1]=squares[click];
        if(squares[click]<=0)
        {
           click=0;
           for(int i=0;i<14;i++)
            {
              x[i]=i*90;
              y[i]=0;
              squares[i]=4;
              quick=initQuick;
              
            }
            return;
        }
      }
      else{
        y[click+1]=y[click];
        squares[click+1]=squares[click];
      }
    }
    click++;
    quick-=15;
    }
  }
 }
