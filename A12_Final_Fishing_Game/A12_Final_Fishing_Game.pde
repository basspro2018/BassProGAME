//Marcoux Patric      -      A12_Final_Fishing_Game

int level = 0;
int X = 1300;
int Rod;
int FishX;
int FishY;
int Tension;
int index;
int timer;
int distance;

PImage[] Sp_ = new PImage[4];

PImage Lake;
PImage Up;
PImage Down;
PImage Right;
PImage Left;
PImage Spacebar;
PImage Fishing;
PImage Opening;
PImage Fish1;
PImage Fish2;
PImage Fish3;
PImage Fish4;
PImage Boss;
PImage Rod0;
PImage Rod1;
PImage Rod2;
PImage Rod3;
PImage Rod4;
PImage Gradient;
PImage Arrow;
PImage Boi;

void setup() {

  //1366 x 768
  fullScreen();

  Up = loadImage("Up.png");
  Down = loadImage("Down.png");
  Left = loadImage("Left.png");
  Right = loadImage("Right.png");
  Spacebar = loadImage("Spacebar.png");
  Fishing = loadImage("Fishing.png");
  Lake = loadImage("Lake.jpg");
  Opening = loadImage("Opening.jpg");
  Rod0 = loadImage("Rod0.png");
  Rod1 = loadImage("Rod1.png");
  Rod2 = loadImage("Rod2.png");
  Rod3 = loadImage("Rod3.png");
  Rod4 = loadImage("Rod4.png");
  Gradient = loadImage("Gradient.png");
  Arrow = loadImage("Arrow.png");
  Boi = loadImage("Boi.png");

  Sp_[0] = loadImage("Sp_0.png");
  Sp_[1] = loadImage("Sp_1.png");
  Sp_[2] = loadImage("Sp_2.png");
  Sp_[3] = loadImage("Sp_3.png");

  Rod = 2;

 Tension = 245;
}

void draw() {


  if (level == 0) {
    image(Lake, 0, 0, 1366, 768);
    image(Up, 165, 170, 35, 35);
    image(Down, 275, 170, 35, 35);
    image(Left, 165, 270, 35, 35 );
    image(Right, 275, 270, 35, 35 );
    image(Spacebar, 400, 370, 100, 35);
    image(Fishing, 800, 400, 300, 300);
    textSize(60);
    text("WELCOME TO BASS PRO 2018", 250, 100 );
    textSize(30);
    text("Use      and      to adjust the tension. Keep the tension arrow within the blue.", 100, 200);
    text("Use      and      to adjust the direction. Keep your rod facing opposit to the fish.", 100, 300);
    text("Before pulling using            make sure both requiorments are met in the above text.", 100, 400);
    textSize(45);
    text("Press Enter to Begin", 300, 600);
    if (keyCode == ENTER) {
      level += 1;
    }
  }

  if (level == 1) {
    
    clear();
  
    if ( Tension <= 245 && Tension >=50) {
     
        Tension -= 1.5;
      }
      
      if (Tension >= 246 && Tension <= 440){
        
        Tension += 1.5;
      }
      
      
    image(Lake, 0, 0, 1366, 768);

    image(Gradient, 50, 50, 400, 30);
    image(Arrow, Tension, 50, 10, 30);
    
    //Makes each Sp_ image number assosiate itself with the index to be displayed
  image(Sp_[index], 700, 500, 50,50);
  
  //Increas timer
  timer++;
  
  //When time reaches 20 it resets and the index increases by one
  if (timer > 0.1) {
    timer = 0;
    index++;
    
    //When the index reaches 7 this code resets it so it can redisplay the images
    if (index >3) {

      index=0;
    }
  }
   
    if (Rod == 2) {
      image(Rod2, 658.5, 312);
    }
    if (Rod == 1) {
      image(Rod1, 515, 405);
    }
    if (Rod == 0) {
      image(Rod0, 407, 480);
    }

    if (Rod == 4) {
      image(Rod4, 682, 438);
    }
    if (Rod == 3) {
      image(Rod3, 688, 403);
    }
  }
}


void keyPressed(){
   if (keyCode == LEFT && Rod >= 1) {
      Rod--;
    }
    if (keyCode == RIGHT && Rod <= 3) {
      Rod++;
    }
     if(keyCode == UP && Tension <= 440){
       Tension = Tension +10;
    }
    if(keyCode == DOWN && Tension >= 50){
      Tension = Tension -10;
    }
}