SpaceShip spaceBallOne; 
Star [] twinkle;
ArrayList <Asteroid> rockInSpace;

public void setup() 
{
	size(500,500);
	spaceBallOne = new SpaceShip();
	rockInSpace = new ArrayList <Asteroid>();
	for (int i = 0; i < 10; i++) {
		rockInSpace.add(new Asteroid());
	}
	twinkle = new Star[100];
	for (int i = 0; i < twinkle.length; i++) {
		twinkle[i] = new Star((int)(Math.random()*500),(int)(Math.random()*500));
	}

}
public void draw() 
{
	background(0);
	spaceBallOne.show();
	spaceBallOne.move();
	for (int i = 0; i < twinkle.length; i++) {
		twinkle[i].show();
	}
	for (int i = 0; i < rockInSpace.size(); i++) {
		if (dist(spaceBallOne.getX(),spaceBallOne.getY(),rockInSpace.get(i).getX(),rockInSpace.get(i).getY()) < 20) {
			rockInSpace.remove(i);
		}
		else {
			rockInSpace.get(i).show();
			rockInSpace.get(i).move();
		}
	}
}

public void keyPressed() 
	{
		if(key == 'w') {
			spaceBallOne.accelerate(1);
		}
		if(key == 's') {
			spaceBallOne.accelerate(-1);
		}
		if(key == 'a') {
			spaceBallOne.rotate(10);
		}
		if(key == 'd') {
			spaceBallOne.rotate(-10);
		}
		if (key == 'z') {
			spaceBallOne.setPointDirection((int)(Math.random()*360));
			spaceBallOne.setX((int)(Math.random()*500));
			spaceBallOne.setY((int)(Math.random()*500));
			spaceBallOne.setDirectionX(0);
			spaceBallOne.setDirectionY(0);
		}
	}

class Asteroid extends	Floater 
{
	private int rotationSpeed;
	public Asteroid() {
		rotationSpeed = (int)(Math.random() * 3) - 1;

		corners = 5;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = 5;
		yCorners[0] = 0;
		xCorners[1] = 0;
		yCorners[1] = 8;
		xCorners[2] = -7;
		yCorners[2] = 7;
		xCorners[3] = -8;
		yCorners[3] = -8;
		xCorners[4] = 0;
		yCorners[4] = -8;

		myCenterX = (int)(Math.random() * 500);
		myCenterY = (int)(Math.random() * 500);
		myDirectionX = (int)(Math.random() * 5) - 2;
		myDirectionY = (int)(Math.random() * 5) - 2;
		myPointDirection = 0;
		myPointDirection = 0;
		myColor = color(128,128,128);
	}
	public void setX(int x){myCenterX = x;}
	public int getX(){return (int)myCenterX;}   
	public void setY(int y){myCenterY = y;}
	public int getY(){return (int)myCenterY;}
	public void setDirectionX(double x) {myDirectionX = x;} 
	public double getDirectionX(){return myDirectionX;}
	public void setDirectionY(double y){myDirectionY = y;}  
	public double getDirectionY(){return myDirectionY;}
	public void setPointDirection(int degrees){myPointDirection = degrees;} 
	public double getPointDirection() {return myPointDirection;}
	public void move() {
		rotate(rotationSpeed);
		super.move();
	}

}

class SpaceShip extends Floater  
{   
	public SpaceShip() {
		corners = 3;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = 16;
		yCorners[0] = 0;
		xCorners[1] = -8;
		yCorners[1] = -8;
		xCorners[2] = -8;
		yCorners[2] = 8;
		myCenterX = 250;
		myCenterY = 250;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = 0;
		myPointDirection = 0;
		myColor = 255;

	}
	public void setX(int x) {myCenterX = x;} 
	public int getX(){return (int)myCenterX;}   
	public void setY(int y){myCenterY = y;}
	public int getY(){return (int)myCenterY;}
	public void setDirectionX(double x) {myDirectionX = x;} 
	public double getDirectionX(){return myDirectionX;}
	public void setDirectionY(double y){myDirectionY = y;}  
	public double getDirectionY(){return myDirectionY;}
	public void setPointDirection(int degrees){myPointDirection = degrees;} 
	public double getPointDirection() {return myPointDirection;}
	

 }

 class Star {
 	private int myX;
 	private int myY;

 	public Star(int x, int y) {
 		myX = x;
 		myY = y;
 	}
 	public void show() {
 		fill(255);
 		ellipse(myX,myY,5,5);
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
    stroke(myColor);    
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

