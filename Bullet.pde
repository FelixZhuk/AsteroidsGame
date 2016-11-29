class Bullet extends Floater {
	public Bullet(SpaceShip spaceBallOne) {
		myCenterX = spaceBallOne.getX();
		myCenterY = spaceBallOne.getY();
		myPointDirection = spaceBallOne.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + spaceBallOne.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + spaceBallOne.getDirectionY();
		myColor = color(255,255,0);
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

	public void show() {
		fill(myColor);   
	    stroke(myColor);    
	   	ellipse((float)myCenterX,(float)myCenterY, (int)3,(int)3); 
	}
}