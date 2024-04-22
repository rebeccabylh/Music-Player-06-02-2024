//Global Variables
int appWidth, appHeight;
float backgroundX, backgroundY, backgroundWidth, backgroundHeight;
float albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight;
float playButtonX, playButtonY, playButtonWidth, playButtonHeight;
float quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight;
float progressBarX, progressBarY, progressBarWidth, progressBarHeight;
float backButtonX, backButtonY, backButtonWidth, backButtonHeight;
float nextButtonX, nextButtonY, nextButtonWidth, nextButtonHeight;
float playlistNameX, playlistNameY, playlistNameWidth, playlistNameHeight;
float nameOfSongX, nameOfSongY, nameOfSongWidth, nameOfSongHeight;
float artistNameX, artistNameY, artistNameWidth, artistNameHeight;
//
color backgroundColour;
color darkBackground = 0;
color whiteBackground = 255;
Boolean whiteMode = false;
color foregroundColour;
color white =255;
color black= 0;
color pink = #FFEDF8;
color darkPink = #E3B5D2;
int size;
PFont generalFont;
//
void setup() {
  //size(400, 500);
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  //Landscape is HARDCODED
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bruh, turn your phone";
  println( displayInstructions);
  //
  String[] fontList = PFont.list();
printArray(fontList);
size= 40;
generalFont = createFont("Consolas", size);
  //
  //Populate
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth;
  backgroundHeight = appHeight;
  albumCoverX = appWidth*3.7/17;
  albumCoverY = appHeight*22/100;
  albumCoverWidth = appWidth*9/16;
  albumCoverHeight = appHeight*45/100;
  playButtonX = appWidth*3.5/8;
  playButtonY = appHeight*8/9;
  playButtonWidth = appWidth*1/8;
  playButtonHeight = appHeight*1/12;
  quitButtonX = appWidth*1/16;
  quitButtonY = appHeight*29/32;
  quitButtonWidth = appWidth*9/100;
  quitButtonHeight = appHeight*4/100;
  progressBarX = appWidth*20/100;
  progressBarY = appHeight*8.3/12;
  progressBarWidth = appWidth*60/100;
  progressBarHeight = appHeight*0.5/7.5;
  backButtonX = appWidth*22/100;
  backButtonY = appHeight*8/9;
  backButtonWidth = appWidth*1/12;
  backButtonHeight = appHeight*1/14;
  nextButtonX  = appWidth*3.5/5;
  nextButtonY  = appHeight*8/9;
  nextButtonWidth  = appWidth*1/12;
  nextButtonHeight  = appHeight*1/14;
  playlistNameX  = appWidth*29/100;
  playlistNameY  = appHeight*2/16;
  playlistNameWidth  = appWidth*5/12;
  playlistNameHeight  = appHeight*1.5/18;
  nameOfSongX  = appWidth*3.5/8.7;
  nameOfSongY  = appHeight*6/7.8;
  nameOfSongWidth  = appWidth*1.5/8;
  nameOfSongHeight  = appHeight*1.5/28;
  artistNameX  = appWidth*3.48/8;
  artistNameY  = appHeight*6.7/8;
  artistNameWidth  = appWidth*1/8;
  artistNameHeight  = appHeight*2/80;
  //Layout DIVs
  rect(backgroundX, backgroundY, backgroundWidth, backgroundHeight);
  //int centerX = appWidth * 1/2;
  //int centerY= appHeight * 1/2;
  //rect(centerX * 1/2, centerY * 1/2, appWidth *1/2, appHeight* 1/2);
  rect(albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight);
  rect(playButtonX, playButtonY, playButtonWidth, playButtonHeight);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  rect(progressBarX, progressBarY, progressBarWidth, progressBarHeight);
  rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);
  rect(nextButtonX, nextButtonY, nextButtonWidth, nextButtonHeight);
  rect(playlistNameX, playlistNameY, playlistNameWidth, playlistNameHeight);
  rect(nameOfSongX, nameOfSongY, nameOfSongWidth, nameOfSongHeight);
  rect(artistNameX, artistNameY, artistNameWidth, artistNameHeight);
  //Var Population
  if (whiteMode==true && hour()>=9 && hour()<=17) {
    backgroundColour = whiteBackground;
    foregroundColour = black;
  } else {
    backgroundColour = darkBackground;
    foregroundColour = darkPink;
    if (hour()>=9 && hour()<=17 ) foregroundColour = white;
  }
  if (hour()<9 && hour()>17) foregroundColour = darkPink;
  if (hour()>=9 && hour()<=17) foregroundColour = white; //switch up code a bit
  //
} // End Setup
//
void draw () {
  background(backgroundColour);
  fill(foregroundColour);
  //
  //fill(white);
  //if (mouseX> quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) fill(pink);
  fill(pink);
  rect(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
  if (mouseX> quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) {
    fill(darkPink);
    rect(quitButtonX+quitButtonWidth*1/12, quitButtonY+quitButtonHeight*0.5/6, quitButtonWidth*7.5/8, quitButtonHeight);
    fill(foregroundColour);
  } else {
    fill(pink);
  }
  fill(black);
textAlign(CENTER, CENTER); 
size = 45;
textFont(generalFont, size);
text(quitButtonX, quitButtonY, quitButtonWidth, quitButtonHeight);
//
//fill(black);
//textAlign(CENTER, CENTER); 
//size = 45;                        //don't worry much about this one yet
//textFont(generalFont, size);
//text(footer, footerX, footerY, footerWidth, footerHeight);
} // End Draw
//
void keyPressed () {
  if (key=='Q' || key=='q') exit();
  if (key==CODED && keyCode==ESC) exit();
  //
  if (key=='W' || key=='w');
} // End keyPressed
//
void mousePressed () {
  if (mouseX> quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) {
    exit();
  }
} // End mousePressed
//
// End Main Program
