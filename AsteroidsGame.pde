SpaceShip cow = new SpaceShip();
Dog [] dog = new Dog [200];
ArrayList <Asteroid> theList = new ArrayList <Asteroid>();
ArrayList <Bullet> joke = new ArrayList <Bullet>();
public void setup() 
{
  //your code here
  size (666, 666);
  for (int i = 0; i <dog.length; i++) 
  {
    dog [i] = new Dog();
  }
  for (int k = 0; k <15; k++) 
  {
    theList.add(k, new Asteroid());
  }
}
public void draw() 
{
  background (0.6);
  cow.show();
  cow.move();
  for (int i = 0; i <dog.length; i++) 
  {
  dog[i].show();
  }
  for (int j = 0; j < joke.size(); j++)
  {
    joke.get(j).show();
    joke.get(j).move();
  }
  for (int k = 0; k <theList.size(); k++) 
  {
    theList.get(k).show();
    theList.get(k).move();
    theList.get(k).rotate(6);
    if((dist(cow.getX(),cow.getY(), theList.get(k).getX(),theList.get(k).getY()) < 20))
    {
      theList.remove(k);
    }
  }
  for(int k = 0; k < theList.size(); k++)
  {
    for(int j = 0; j < joke.size(); j++)
    {
      if(dist((float)joke.get(j).getX(), (float)joke.get(j).getY(), (float)theList.get(k).getX(), (float)theList.get(k).getY()) < 20)
      {
        joke.remove(j);
        theList.remove(k);
        break;
      }
    }
  }

}
public void keyPressed()
{
  if (keyPressed && keyCode == 40) {cow.accelerate(-0.5);}
  if (keyPressed && keyCode == 39) {cow.rotate(5);}
  if (keyPressed && keyCode == 38) {cow.accelerate(0.5);}
  if (keyPressed && keyCode == 37) {cow.rotate(-5);}
  if (keyPressed && keyCode == 17)
    {
      cow.setX((int)(Math.random()*666));
      cow.setY((int)(Math.random()*666));
      cow.setDirectionX(0);
      cow.setDirectionY(0);
      cow.setPointDirection((int)(Math.random()*360));
    }
  if(keyCode == 32)
  {
    joke.add(new Bullet());
  }
}
class SpaceShip extends Floater  
{   
  public void setX(int x) {myCenterX=x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY=y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX (double x) {myDirectionX=x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY (double y) {myDirectionY=y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection (int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  
  SpaceShip()
  {
  corners=3;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -6;
  yCorners[0] = -6;
  xCorners[1] = 12;
  yCorners[1] = 0;
  xCorners[2] = -6;
  yCorners[2] = 6;
  myColor=255;
  myCenterX=333;
  myCenterY=333;
  myDirectionX=0;
  myDirectionY=0;
  myPointDirection=0;
  }
}
class Asteroid extends Floater
{   
  public void setX(int x) {myCenterX=x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY=y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX (double x) {myDirectionX=x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY (double y) {myDirectionY=y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection (int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
  
  Asteroid()
  {
  corners=6;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -10;
  yCorners[0] = -7;
  xCorners[1] = (int)(Math.random()*12)+6;
  yCorners[1] = -10;
  xCorners[2] = (int)(Math.random()*6)+9;
  yCorners[2] = 5;
  xCorners[3] = (int)(Math.random()*8);
  yCorners[3] = (int)(Math.random()*7)+9;
  xCorners[4] = -15;
  yCorners[4] = (int)(Math.random()*8)+5;
  xCorners[5] = -16;
  yCorners[5] = 0;
  myColor=255;
  myCenterX=Math.random()*500;
  myCenterY=Math.random()*500;
  myDirectionX=Math.random()*12-6;
  myDirectionY=Math.random()*12-6;
  myPointDirection=Math.random()*6;
  }
}

public class Bullet extends Floater
{
  public void setX(int x) {myCenterX = x;}    
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}    
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
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
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
}
class Dog
{
  private int myX, myY;
  public void setx (int x) {myX=x;}
  public int getx() {return myX;}
  public void sety (int y) {myY=y;}
  public int gety() {return myY;}
  public Dog()
  {
    myX=(int)(Math.random()*666);
    myY=(int)(Math.random()*666);
  }
  public void show()
  {
    fill(255);
    ellipse (getx(), gety(), 1,1);
  }
}
