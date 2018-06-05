//Marcoux Patric      -      A12_Final_Fishing_Game

//Number Variables
int level = 0;
int X = 1300;
int Rod;
int FishX;
int FishY;
int Tension;
int timer;
int index;
int time;
int frames;
int distance;
int Fish;
int Side;
int time2;

//Gif image variables
PImage[] Sp_ = new PImage[4];

//Variables for all images
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
PImage RepF;
PImage Bar;
PImage Snap;

//music
//import processing.sound.*;

// SoundFile file;
//replace the sample.mp3 with your audio file name here
//String audioName = "music.mp3";
// String path;

//Runs the Following once
void setup() {
  // path = sketchPath(audioName);
  //  file = new SoundFile(this, path);
  //   file.play();

  //Sets image to full screen
  //1366 x 768
  fullScreen();

  //Loads each image with its correspondant variable
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
  Bar = loadImage("Bar.png");
  RepF = loadImage("RepF.png");
  Snap = loadImage("Snap.jpg");
  Fish1 = loadImage("Fish1.png");

  //Loads each Gif image in
  Sp_[0] = loadImage("Sp_0.png");
  Sp_[1] = loadImage("Sp_1.png");
  Sp_[2] = loadImage("Sp_2.png");
  Sp_[3] = loadImage("Sp_3.png");

  //Sets level to start as 0
  level = 0;
  
  //Sets "Rod" variable to start as 2
  Rod = 2;

  //Sets "Tension" variable to start as 245
  Tension = 245;

  //Seys "distance" variable to start as 250
  distance = 250;
}

//Runs the following 60 times per second
void draw() {

  //Starting screen
  if (level == 0) {
    //Loads all images in Starting screen
    image(Lake, 0, 0, 1366, 768);
    image(Up, 165, 170, 35, 35);
    image(Down, 275, 170, 35, 35);
    image(Left, 165, 270, 35, 35 );
    image(Right, 275, 270, 35, 35 );
    image(Spacebar, 400, 370, 100, 35);
    image(Fishing, 800, 400, 300, 300);
    //Places text on starting screen
    textSize(60);
    text("WELCOME TO BASS PRO 2018", 250, 100 );
    textSize(30);
    text("Use      and      to adjust the tension. Keep the tension arrow within the blue.", 100, 200);
    text("Use      and      to adjust the direction. Keep your rod facing opposit to the fish.", 100, 300);
    text("Before pulling using            make sure both requiorments are met in the above text.", 100, 400);
    textSize(45);
    text("Press Enter to Begin", 300, 600);

    //When enter is pressed level = 1
    if (keyCode == ENTER) {
      level += 1;
    }
  }

  //Coading for in game level
  if (level == 1) {

    //Clears all past coading
    clear();

    //Loads images and text in level 1
    image(Lake, 0, 0, 1366, 768);
    image(Boi, 678, 500, 10, 10);
    image(Gradient, 50, 50, 400, 30);
    image(Arrow, Tension, 50, 10, 30);
    image(Bar, 1300, 150, 25, 520);
    image(RepF, 1302, distance, 20, 15);
    text(time, 400, 200);
    text(Side, 500, 200);
    text(Tension, 600,200);
    //                              Cout
    //makes frames increase
    frames++;
    //Allows Cout to follow the Frames per Second
    if (frames > 45) {
      //Resets Frame Count Whenever Limit is Passed
      frames = 0;
      //Increases time and Connects the Time to the Frames
      time++;
    }
      //Resets time to 3 when it equals 5
      if (time == 5) {
        time = 3;
      }
      //If time equals 4 Side equals 600
      if (time == 3) {
        Side = 650;
      }
      //If time equals 3 Side equals 690
      if(time >= 4){
        Side = 690;
      }
    
    //If time is above 2 the fish is active
    if (time >= 3) {
      Fish = 1;
    }
    //Sets activity when fish is active
    if (Fish == 1) {
      //Makes tention increase
      if ( Tension <= 245 && Tension >= 49) {
        Tension -= 1.5;
      }
      //Makes tention decrease
      if (Tension >= 246 && Tension <= 441) {
        Tension += 1.5;
      }

      //Makes each Sp_ image number assosiate itself with the index to be displayed
      image(Sp_[index], Side, 485, 30, 30);

      //Increases timer
      timer++;

      //Increases index when timer equals 0.1
      if (timer > 0.1) {
        timer = 0;
        index++;

        //When the index reaches 4 this code resets it so it can redisplay the images
        if (index >3) {
          index=0;
        }
      }
    }

    //Associates Rod variable with Rod[] images
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

    //End Game code if Tension gets to high
    if (Tension <= 50 && Fish == 1) { 
      //Clears code
      clear();
      //Creates text
      textSize(100);
      text("The Line Broke", 350, 300);
      //Connects the Frames to the Time
      frames++;
      //Allows Coudown to follow the Frames per Second
      if (frames > 30) {
        //Resets Frame Count Whenever Limit is Passed
        frames = 0;
        //Increases time
        time2++;
      }

      if (time2 >= 3) {
        //Clears code
        clear();
        //Plays code in setup
        setup();
      }
    }

    if ((Tension >= 440 && Fish == 1)|| (distance <= 160)) {
      clear();
      //Places text
      textSize(100);
      text("The Fish Escaped", 350, 300);

      //Increase time
      frames++;
      //Allows Count to follow the Frames per Second
      if (frames > 30) {
        //Resets Frame Count Whenever Limit is Passed
        frames = 0;
        //Increases time
        time2++;
      }

      //Resets all to level 0
      if (time2 >= 3) {
        //Clears code
        clear();
        //Plays code in setup
        setup();
      }
    }
    //Winning screen
    if (distance >= 650) {
      clear();
      background(#C6B61C);
      text("You Have Caught a Carp", 400, 150);
      image(Fish1, 400, 300, 600, 350);
    }
  }
}

// Void for keys 
void keyPressed() {
  //When left is pressed Rod variable decreases
  if (keyCode == LEFT && Rod >= 1) {
    Rod--;
  }
  //When Right is pressed Rod variable increases
  if (keyCode == RIGHT && Rod <= 3) {
    Rod++;
  }
  if (keyCode == UP && Tension <= 440) {
    Tension = Tension +10;
  }
  ////When down is pressed Tension variable increases
  if (keyCode == DOWN && Tension >= 50) {
    Tension = Tension -10;
  }
  //Creates posative reponces to Tention and distance when these requiorments are met while the fish is active
  if (Fish == 1) {
    if ((Rod == 0 && Side == 690) || (Rod == 4 && Side == 650)) {
      // 32 = Spacebar
      if (keyCode == 32 && (Tension >= 200)) {
        if(Tension >= 246 && Tension <= 290){
        distance += 50;
        Tension -= 100;
        }
        if(Tension >= 200 && Tension <= 245);
        distance += 100;
        Tension += 100;
      }
    }
    //Creates negative reponces to Tention and distance when these requiorments are met while the fish is active
    if (keyCode == 32 &&((Rod >= 1 && Side == 690) || (Rod <= 3 && Side == 650)||((Tension <= 199 && Tension >= 51)||(Tension >= 291 && Tension <= 439)))) {
      distance -= 50;
      Tension += 50;
    }
  }
}