SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;

float a; //Slot0FruitID
float b; //Slot1FruitID
float c; //Slot2FruitID
int d;   //Slot0FruitCount
int e;   //Slot1FruitCount
int f;   //Slot2FruitCount
int winScore;
int allSeven;
// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
      
      allSeven = machine.probability(0.9);
      
      totalScore = totalScore - 50;
      
      a = random(6)*allSeven;
      b = random(6)*allSeven;
      c = random(6)*allSeven;
      
       
      
      machine.setSlotFruit(0,int(a));
      machine.setSlotFruit(1,int(b));
      machine.setSlotFruit(2,int(c));
      
      
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
      
      d = machine.getFruitCount(int(a));
      e = machine.getFruitCount(int(b));
      f = machine.getFruitCount(int(c));
      
      winScore = d*machine.getSlotScore(int(a))+e*machine.getSlotScore(int(b))+f*machine.getSlotScore(int(c));
      
      totalScore = totalScore+winScore;
      
      
      // -------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}







