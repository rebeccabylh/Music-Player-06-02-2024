//For minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
Minim minim;
AudioPlayer playList1;
AudioPlayer soundEffects1;
//
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
int size;
PFont generalFont;
String quit= "CLOSE";
//
Boolean whiteMode = false;
color white =255, darkPink = #E3B5D2, pink = #FFEDF8, black= 0;
//
color foregroundColour;
color backgroundColour, whiteBackground = 255, darkBackground = 0;
//
Float albumCoverLEFT, albumCoverCENTERED, albumCoverRight;
PImage albumCoverImage;
Float albumCoverWidthAdjusted, albumCoverHeightAdjusted;
//
void setup() {
  //size();
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;     
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bruh, turn your phone";
  println( displayInstructions);
  //
  minim = new Minim (this);
  String extension = ".mp3";
  String quitButtonSound = "Daytime Forrest Bonfire";
  String pathwaySoundEffects = "../Songs";
  println(pathwaySoundEffects+quitButtonSound+extension);
  String path = sketchPath(pathwaySoundEffects+quitButtonSound+extension);
  println(path);
  soundEffects1 = minim.loadFile(path);
  //playList1 = minim.loadFile(path);
  //
  //printArray(fontList);
  size= (appWidth > appHeight) ? appHeight : appWidth;
  generalFont = createFont("Consolas", size);
  //
  String lilyOfTheValley = "gettyimages-550196925";
  String extensionJPG = ".jpg";
  String pathway = "../Images/";
  String albumCoverImagePath = pathway + lilyOfTheValley + extensionJPG;
  albumCoverImage = loadImage(albumCoverImagePath);
  //
  Float smallerAlbumCoverDimension = (albumCoverWidth < albumCoverHeight) ? albumCoverWidth : albumCoverHeight;
  Float albumCoverImageWidthPixel = 400.0;                      //figure out later
  Float albumCoverImageHeightPixel = 300.0;
  Float albumCoverAspectRatio = albumCoverImageWidthPixel/albumCoverImageHeightPixel;
  Float largerAlbumCoverDimension = smallerAlbumCoverDimension*albumCoverAspectRatio;
  if ( albumCoverWidth < largerAlbumCoverDimension) {
    while (albumCoverWidth <largerAlbumCoverDimension) {
    largerAlbumCoverDimension -= 1;
    smallerAlbumCoverDimension -=1;
    }
  };
albumCoverWidthAdjusted = largerAlbumCoverDimension;
albumCoverHeightAdjusted = smallerAlbumCoverDimension;
// 
albumCoverLEFT = albumCoverX;
albumCoverCENTERED = albumCoverX + (albumCoverWidth - albumCoverWidthAdjusted)/2;
albumCoverRight = albumCoverX + albumCoverWidth - albumCoverWidthAdjusted;
  //
  //Populate
  backgroundX = appWidth*0;
  backgroundY = appHeight*0;
  backgroundWidth = appWidth-1;
  backgroundHeight = appHeight-1;
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
  if (hour()>=9 && hour()<=17) foregroundColour = white;
} // End Setup
//
void draw () {
  background(backgroundColour);  //I don't want a background image lol
  fill(foregroundColour);
  //
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
  fill(pink);
  rect(albumCoverX, albumCoverY, albumCoverWidth, albumCoverHeight);
  image(albumCoverImage, albumCoverCENTERED, albumCoverY, albumCoverWidthAdjusted, albumCoverHeightAdjusted);
  //
  /*fill(pink);
  //
  fill(pink);
  rect(progressBarX, progressBarY, progressBarWidth, progressBarHeight);
  //
  fill(pink);
  rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);
  //
  fill(pink);
  rect(nextButtonX, nextButtonY, nextButtonWidth, nextButtonHeight);
  //
  fill(pink);
  rect(playlistNameX, playlistNameY, playlistNameWidth, playlistNameHeight);
  //
  fill(pink);
  rect(nameOfSongX, nameOfSongY, nameOfSongWidth, nameOfSongHeight);
  //
  fill(pink);
  rect(artistNameX, artistNameY, artistNameWidth, artistNameHeight);
  */
} // End Draw
//
void keyPressed () {
  if (key=='Q' || key=='q') exit();
  //
  if (key==CODED && keyCode==ESC) exit();
} // End keyPressed
//
void mousePressed () {
  if (mouseX> quitButtonX && mouseX<quitButtonX+quitButtonWidth && mouseY>quitButtonY && mouseY<quitButtonY+quitButtonHeight) {
  }
} // End mousePressed
//
// End Main Program
