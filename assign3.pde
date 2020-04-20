final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;


int soldierX,soldierY,soldierSpeed;
int groundhogX,groundhogY,groundhogSpeed;
int cabbageX,cabbageY;
int lifeY;



PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage life ,robot ,soil ,soldier ,cabbage ;
PImage groundhogIdle ,groundhogDown ,groundhogLeft, groundhogRight;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage stone1,stone2;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean noPressed = true;

boolean cabbageTouched = false;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;

float cameraOffsetY = 0;


boolean debugMode = false;
boolean inGame = false;



void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
lifeY = 10;
	soil8x24 = loadImage("img/soil8x24.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  playerHealth = 2;
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  groundhogX = 320;
  groundhogY = 80;
  groundhogSpeed = 80;
  
  life = loadImage("img/life.png");


  soldier = loadImage("img/soldier.png");
  //set soldier's coordinate
  soldierX = -80;
  soldierY = floor(random(2,6))*80;
  
  cabbage = loadImage("img/cabbage.png");
  cabbageX = floor(random(1,8))*80;
  cabbageY = floor(random(2,6))*80;
  
  gameState = GAME_START;
  
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    if (inGame) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    // soil0
		for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil0, w*80 , 160+h*80);
        if(w==h)
        image(stone1,w*80,160+h*80);
      }
    }
    // soil1
    for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil1, w*80 , 480+h*80);
        if(w-4==h)
        image(stone1,w*80,480+h*80);
      }
    }
    
    // soil2
    for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil2, w*80 , 800+h*80);
      }
    }
    // soil3
    for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil3, w*80 , 1120+h*80);
      }
    }
    // soil4
    for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil4, w*80 , 1440+h*80);
      }
    }    
    // soil5
    for(int w=0; w<8; w++){
      for(int h=0;h<4;h++){
        image(soil5, w*80 , 1760+h*80);
      }
    } 
    
    //stone9~16
    for(int w=0;w<8;w++)
    {
      for(int h=0;h<4;h++)
      {
        if(w+2==h||w-2==h||w-6==h)
        image(stone1,w*80,800+h*80);
        if(w+2==h||w-2==h||w-6==h)
        image(stone1,w*80,800+(3-h)*80);
        
        if(w+2==h||w-2==h||w-6==h)
        image(stone1,w*80,1120+h*80);
        if(w+2==h||w-2==h||w-6==h)
        image(stone1,w*80,1120+(3-h)*80);
      }
    }
    
    //stone17~24
    for(int w=0;w<8;w++)
    {
      for(int h=0;h<4;h++)
      {
        if(((w+2-h))%3==0)
        image(stone1,w*80,1440+(3-h)*80);
        if(((w+1-h))%3==0)
        {
        image(stone1,w*80,1440+(3-h)*80);
        image(stone2,w*80,1440+(3-h)*80);
        }
      }
    }
    
    //stone25~32
    for(int w=0;w<8;w++)
    {
      for(int h=0;h<4;h++)
      {
        if(((w-h))%3==0)
        image(stone1,w*80,1760+(3-h)*80);
        if(((w-1-h))%3==0)
        {
        image(stone1,w*80,1760+(3-h)*80);
        image(stone2,w*80,1760+(3-h)*80);
        }
      }
    }
    
    //life
    
    for(int i = 0;i <playerHealth ;i++){
      image(life, 10+i*(50+20),lifeY);
    }
    
    //set soldier
    image(soldier,soldierX,soldierY);
    //let the soldier move 
    soldierSpeed = 2;
    soldierX += soldierSpeed;
    soldierX %= 640; 
    
    //set cabbage
    if(cabbageTouched == false){
      image(cabbage,cabbageX,cabbageY);
    }
    
    //set groundhog 
    
    if(downPressed == true){
    image(groundhogDown,groundhogX,groundhogY);
    }
    
    if(rightPressed == true){
    image(groundhogRight,groundhogX,groundhogY);
    }
    
    if(leftPressed == true){
    image(groundhogLeft,groundhogX,groundhogY);
    }
    
    if(noPressed == true){
    image(groundhogIdle,groundhogX,groundhogY);
    }
    
    
    //boundary detection
    
    if(groundhogX > 560){
      groundhogX = 560; 
    }
    
    if(groundhogX < 0){
      groundhogX = 0; 
    }
    /*
    if(groundhogY < 80){
      groundhogY = 80; 
    }
    */
    if(groundhogY > 2000){
      groundhogY = 2000; 
    }
    
    //don' touch soldier
    if(groundhogX >= soldierX && groundhogX < soldierX+80 && groundhogY >= soldierY && groundhogY < soldierY+80){
      groundhogX = 320; 
      groundhogY = 80; 
      playerHealth -= 1;
    }

    //eat cabbage
    if(groundhogX >= cabbageX && groundhogX < cabbageX+80 && groundhogY >= cabbageY && groundhogY < cabbageY+80 && cabbageTouched == false){
    cabbageTouched = true;
    if(playerHealth<5){
      playerHealth += 1 ;
    }
    }


		// Player

		// Health UI

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
    
    if (inGame) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
  if (key == CODED){
    switch (keyCode){

      case DOWN:
        downPressed = true;
        noPressed = false;
        groundhogY += groundhogSpeed;
        
        
        break;
      case RIGHT:
        rightPressed = true;
        noPressed = false;
         groundhogX += groundhogSpeed;
        break;
      case LEFT :
        leftPressed = true;
        noPressed = false;
        groundhogX -= groundhogSpeed;
        break;
    }
  }
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
    if (key == CODED){
    switch (keyCode){

      case DOWN:
        downPressed = false;
        noPressed = true;
        inGame = true;
        if (cameraOffsetY > -1600){
        cameraOffsetY -= 80;
        lifeY += 80;
        }
        break;
      case RIGHT:
        rightPressed = false;
        noPressed = true;
        break;
      case LEFT :
        leftPressed = false;
        noPressed = true;
        break;
    }
  }
}
