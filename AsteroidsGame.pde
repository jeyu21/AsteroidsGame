Spaceship bob = new Spaceship();

Star[] nightSky = new Star[200];
public void setup() 
{
  size(500, 500);
  background(0);
  for(int i =0; i<200; i++){
    nightSky[i] = new Star();
}
}
public void draw() 
{
  background(0);
  for(int i =0; i<200; i++){
    nightSky[i].show();
  }
  bob.show();
  bob.move();

  }
  public void keyPressed() {
  if(key==' '){ 
       bob.hyperspace(); 
  } 
  if(keyCode==UP){     
   bob.accelerate(.5); 
  } 
  if(keyCode==DOWN){ 

 
    bob.accelerate(-.3); 
  } 
  if(keyCode==RIGHT){ 
    bob.rotate(7); 
       } 
  if(keyCode==LEFT){ 
    bob.rotate(-7); 
   } 
 }
 //make HYPERSPACE


public class Spaceship extends Floater  
{   

  public void setX(int x){myCenterX = x;};  
  public int getX(){return (int)myCenterX;};   
  public void setY(int y){myCenterY = y;};   
  public int getY(){return (int)myCenterY;};   
  public void setDirectionX(double x){myDirectionX = x;};   
  public double getDirectionX(){return (int)myDirectionX;};   
  public void setDirectionY(double y){myDirectionY = y;};   
  public double getDirectionY(){return (int)myDirectionY;};   
  public void setPointDirection(int degrees){myPointDirection= degrees;};   
  public double getPointDirection(){return (int)myPointDirection;}; 

  public Spaceship(){
    corners = 4;
    xCorners = new int [corners];
    yCorners =new int [corners];
    xCorners[0] = -8;
    yCorners[0]= -8;
    xCorners [1]= 16;
    yCorners[1] = 0;
    xCorners [2]= -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3]= 0;
    myColor=(int)color(0,255,255);
    myCenterX = 300;
    myCenterY =300;
    myDirectionX=0;
    myDirectionY =0;
    myPointDirection = 0;
}
public void hyperspace(){
    myCenterX = (int)(Math.random()*600); 
    myCenterY = (int)(Math.random()*600); 
    myPointDirection = (int)(Math.random()*360); 
    myDirectionX = 0; 
    myDirectionY = 0; 

}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor); 

  
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
  }

class Star{
  private int myX, myY;
  public Star(){
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show() {
    fill(250);
    ellipse(myX,myY,5,5);
  }
}

