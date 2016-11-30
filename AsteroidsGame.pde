Spaceship bob = new Spaceship();
Star[] nightSky = new Star[500];
ArrayList <Asteroid> jim;


public void setup() 
{

  size(800, 800);
  background(10, 10, 20);


  jim = new ArrayList <Asteroid>();
  for (int j = 0; j<50;j++){
    jim.add(j, new Asteroid());

  }

  for(int i =0; i<nightSky.length; i++){
    nightSky[i] = new Star();
}
  

}
public void draw() 
{
  noStroke();
  background(05, 05, 30);
//star
  for(int i =0; i<nightSky.length; i++){
    nightSky[i].show();
  }

//asteroid
   for(int j =0; j<jim.size(); j++){
    jim.get(j).move();
    jim.get(j).show();
    if(dist(bob.getX(), bob.getY(), jim.get(j).getX(), jim.get(j).getY()) < 30) 
      jim.remove(j);   

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
 public class Asteroid extends Floater {
  private int rot;
  
  
  public Asteroid() {
    corners = 8;
    xCorners = new int [corners];
    yCorners =new int [corners];
    xCorners[0] = -16;
    yCorners[0]= 0;
    xCorners [1]= -16;
    yCorners[1] = 16;
    xCorners [2]= -0;
    yCorners[2] = 32;
    xCorners[3] = 16;
    yCorners[3]= 32;
    xCorners [4]= 32;
    yCorners[4] = 16;
    xCorners[5] = 32;
    yCorners[5]= 0;
    xCorners [6]= 16;
    yCorners[6] = -16;
    xCorners[7] = 0;
    yCorners[7]= -16;
  
    myColor=(int)color(0, 250, 0);
    myCenterX = (int)(Math.random()*600);
    myCenterY =(int)(Math.random()*600);
    myDirectionX=(int)(Math.random()*3);
    myDirectionY =(int)(Math.random()*3);
    myPointDirection = (int)(Math.random()*2);
    rot = (int)((Math.random()*50)-25);

  }

  public void move () {
    rotate((int(rot)));
    super.move();
  }
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

  public void show ()  //Draws the floater at the current position  
  {             
    fill(100,100,100); 

  
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
    xCorners[0] = -16;
    yCorners[0]= -16;
    xCorners [1]= 32;
    yCorners[1] = 0;
    xCorners [2]= -16;
    yCorners[2] = 16;
    xCorners[3] = -4;
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
    fill(250,50,150); 

  
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
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*800);
  }
  public void show() {
    fill(250);
    ellipse(myX,myY,3,3);
  }
}


