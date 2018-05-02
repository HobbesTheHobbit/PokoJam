/*Stereo by Eric Mozola
 * May 1, 2018
 */

import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
Gain gain;
AudioMetaData[] meta;
AudioPlayer[] players;
MarqueeText texts;

//x represents the position of the button
int x=256;
//sldPos represents the position of the slider
int sldPos=width/2;
//on is the boonlean var being changed
boolean on = false;
//for when the slider is held
boolean Hold = false;
//fast forward true/false
boolean Fast = false;
//floats for maps
float x1;
float x2;
float posx;
//sets the song
int pl = round(random(1, 11));
;

//gives mouse cords
void test() {
  fill(255);
  textSize(12);
  text(mouseX+" "+mouseY, mouseX, mouseY);
}




void setup()
{
  size(800, 800, P3D);

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  texts = new  MarqueeText("", 2, 10);
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  meta = new AudioMetaData[12];
  players = new AudioPlayer[12];
  for (int i=1; i<players.length; i++) {
    players[i] = minim.loadFile(i+".mp3");
    meta[i] = players[i].getMetaData();
  }
}



//Start of Button and Slider
void mouseClicked() {
  //button change command
  if ((width/2-50 < mouseX) && (mouseX < width/2+50) && (height/5-50 < mouseY) && (mouseY < height/5+150) && (on==true)) {
    on=false;
  } else if ((width/2-50 < mouseX) && (mouseX < width/2+50) && (height/5-50 < mouseY) && (mouseY < height/5+50) && (on==false)) {
    on=true;
  }
  //end of button change command
  //button left side
  else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*6)/12)-(height/24) < mouseY) && (mouseY < ((height*6)/12)+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 1;
  } else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*7)/12)-(height/24) < mouseY) && (mouseY < ((height*7)/12)+(height/24)) && (on==true)) {
    players[pl].pause(); 
    pl = 3;
  } else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*8)/12)-(height/24) < mouseY) && (mouseY < ((height*8)/12)+(height/24)) && (on==true)) {
    players[pl].pause(); 
    pl = 5;
  } else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*9)/12)-(height/24) < mouseY) && (mouseY < ((height*9)/12)+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 7;
  } else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*10)/12)-(height/24) < mouseY) && (mouseY < ((height*10)/12)+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 9;
  } else if (((width/4)-(width/100) < mouseX) && (mouseX < ((width/4)+(width/10))-5) && (((height*11)/12)-(height/24) < mouseY) && (mouseY < ((height*11)/12)+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 11;
  }
  //end of left side
  //buttons right side
  else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*6)/12-(height/24) < mouseY) && (mouseY < (height*6)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 2;
  } else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*7)/12-(height/24) < mouseY) && (mouseY < (height*7)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 4;
  } else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*8)/12-(height/24) < mouseY) && (mouseY < (height*8)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 6;
  } else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*9)/12-(height/24) < mouseY) && (mouseY < (height*9)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 8;
  } else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*10)/12-(height/24) < mouseY) && (mouseY < (height*10)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    pl = 10;
  } else if (((width*3)/4-(width/100) < mouseX) && (mouseX < ((width*3)/4+(width/10))-5) && ((height*11)/12-(height/24) < mouseY) && (mouseY < (height*11)/12+(height/24)) && (on==true)) {
    players[pl].pause();
    //make suffle
    pl = round(random(1, 11));
  }
  //end of button rightside
  if ((width/10 < mouseX) && (mouseX < (width/10)+50) && (height/8 < mouseY) && (mouseY < height/8+50)) {
    if (Fast == false)
    {
      Fast = true;
    } else 
    {
      Fast = false;
    }
  }
  if ((width/4 < mouseX) && (mouseX < (width/4)+50) && (height/7 < mouseY) && (mouseY < height/7+50)) {
    players[pl].rewind();
  }
  //shows the song that is playing
  texts.setText(meta[pl].title() + " by " + meta[pl].author() );
  
}


void mouseReleased() {
  if (Hold==true) {
    Hold=false;
  }
}


void mousePressed() {
  //start of slider positioning

  if ((sldPos-25 < mouseX) && (mouseX < sldPos+25) && (275 < mouseY) && (mouseY < 325)) {
    Hold = true;
  }
}

void sliderMove() {
  if (Hold==true) {
    sldPos=mouseX;
  }
}

void button() {
  //button start
  fill(255);
  ellipse(width/2, height/5, 100, 100);
  fill(0);
  textSize(30);
  //draws button
  if (on==true) {
    text("on", width/2-25, height/5);
  } else {
    text("off", width/2-25, height/5);
  }
  //button end
  fill(0, 0, 255);
  for (int i = 6; i<=11; i++) {
    //left side
    rect((width/4)-5, ((height*i)/12)-(height/24), width/10, height/12);
    //right side
    rect(((width*3)/4)-5, ((height*i)/12)-(height/24), width/10, height/12);
  }
  //speed and other controls
  //fast forward
  rect(width/10, height/7, 50, 50); 
  //rewind
  rect(width/4, height/7, 50, 50);
}


void limiter() {
  //stops the slider at 0 and 10
  if (sldPos < 50) {
    sldPos=50;
  } else if (width-50 < sldPos) {
    sldPos=width-50;
  }
}





void slider() {
  strokeWeight(0);
  //slider start
  //slider bar
  rect(50, height*3/8, width-100, 10);
  strokeWeight(1);
  //slider
  ellipse(sldPos, height*3/8, 50, 50);
  sliderMove();
  //slider end
}

void col() {
  //displays colour
  if (on==true) {
    background(sldPos/2, x, 100);
  }
}

void num() {
  fill(0, 200, 0);
  textSize(12);
  //prints out the slider scale
  int numPlc = width/16;
  for (int i=0; i<=10; i++) {
    text(i+" ", numPlc, 250);
    numPlc += (width/12) + 3;
  }
  //prints the song numbers
  textSize(15);
  for (int i = 1; i<=6; i++) {
    text("Song "+(i+i-1), width/8, (i*67)+((width/2)-67));
  }
  for (int i = 1; i<=5; i++) {
    text("Song "+(i*2), width*5/8, (i*67)+((width/2)-67));
  }
  //lables the buttons
  text("Shuffle", width*5/8, (6*67)+((width/2)-67));
  text("Fast Forward", width/10, height/7);
  text("Rewind", width/4, height/7);
}

float getSetting() {
  return (sldPos - 50 )/40;
}
int  getSettingInt() {
  return round((sldPos - 50 )/40);
}

void sound() {
  for (int i = 1; i < players.length; i++) { 
    // map the mouse position to the audible range of the gain
    float val = map(getSetting(), 10, 1, 6, -30);
    // if a gain control is not available, this will do nothing
    players[i].setGain(val);
  }
  if (on==true) {
    players[pl].play();
  } else {
    players[pl].pause();
  }
}


void lines() {
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  for (int i = 0; i < players[pl].bufferSize() - 1; i++)
  {
    x1 = map( i, 0, players[pl].bufferSize(), 0, width);
    x2 = map( i+1, 0, players[pl].bufferSize(), 0, width);
    stroke(0, 200, 0);
    line( x1, 50 + players[pl].left.get(i)*50, x2, 50 + players[pl].left.get(i+1)*50 );
    line( x1, 50 + players[pl].right.get(i)*50, x2, 50 + players[pl].right.get(i+1)*50 );
  }

  // draw a line to show where in the song playback is currently located
  posx = map(players[pl].position(), 0, players[pl].length(), 0, width);
  stroke(0, 200, 0);
  if (on==true) {
    //line
    line(posx, 0, posx, 100);
    //counter
    fill(0, 200, 0);
    text(round((posx+2)/(width/100)), posx, 15);
  }
  //resets the line
  else {
    line(0, 0, 0, 100);
  }
  //restarts the song
  if ((posx+10)/(width/100) >=98) {
    players[pl].rewind();
  }
}

void fast() {
  if ((Fast == true)&&(on==true)) {
    players[pl].skip(20);
  } else {
  }
}


//end of button and slider
void draw()
{
  background(0);
  stroke(0);
  //col();
  button();
  slider();
  //test();
  num();
  limiter();
  sound();
  fast();
  lines();
  //texts.setColor(color(255,0,0));
  texts.update();
}
