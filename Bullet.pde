class Bullet extends Floater {
	public Bullet(SpaceShip spaceBallOne) {
		myCenterX = spaceBallOne.getX();
		myCenterY = spaceBallOne.getY();
		myPointDirection = spaceBallOne.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + spaceBallOne.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + spaceBallOne.getDirectionY();
	}
}