import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
// Minim Library
//
//Global Variables
Minim minim;
int numberSoundEffects = 4;
int numberMusicSongs = 8;
AudioPlayer[] playList;
AudioPlayer[] soundEffects;
int currentSong = 0;
//
int appWidth, appHeight;
//
void setup() {
  //Display
  //size();
  fullScreen();
  appWidth = displayWidth;
  appHeight = displayHeight;
  String displayInstructions = ( appWidth >= appHeight ) ? "Good To Go" : "Bruh, turn your phone";
  println(displayInstructions);
  //
  minim = new Minim(this);
  String pathwaySoundEffects = "../Songs/";
  String pathwayMusic = "../Songs/";
  String quitButtonSound = "Daytime Forrest Bonfire";
  String JulyJohnPatitucci = "July";
  String extension = ".mp3";
  //println ( pathwaySoundEffects+quitButtonSound+extension );
  //println ( "Relative Pathway:", pathwayMusic+JulyJohnPatitucci+extension );
  String pathQuitButtonSound = sketchPath( pathwaySoundEffects + quitButtonSound + extension );
  String pathMusic = sketchPath( pathwayMusic + JulyJohnPatitucci + extension );
  soundEffects[0] = minim.loadFile( pathQuitButtonSound );
  playList[0] =  minim.loadFile( pathMusic );
  //
} //End setup
//
void draw() {
  println( "Song Position", playList[currentSong].position(), "Song Length", playList[currentSong].length() );
  //
  if (!playList[currentSong].isPlaying() ) println ("Nothing is playing, pick a song");
  if ( playList[currentSong].isLooping() && playList[currentSong].loopCount()!=-1 ) println("There are", playList[currentSong].loopCount(), "loops left.");
  //
  if ( playList[currentSong].isPlaying() ) {
  } else if ( playList[currentSong].length() < 160000 ) {
    playList[currentSong].rewind();
  } else if ( !playList[currentSong].isPlaying()  && ( playList[currentSong].position() > playList[currentSong].length()*0.75 ) ) {
    playList[currentSong].rewind();
    //
    /*
    currentSong = currentSong + 1;
    playList[currentSong].play();
  } else {
  }
  if ( playList[currentSong].isPlaying() ) {
  } else {
    playList[currentSong].rewind();
  }
  
  if (key=='L'|| key=='l') { playList[currentSong].loop(1);
  }
  if (key=='I'|| key=='i') { playList[currentSong].loop();
  //
  if(key=='S'|| key=='s'){
    playList[currentSong].pause();
    playList[currentSong].rewind();
  }
  //
} //End draw
//
void keyPressed() {
  if (key=='P'|| key=='p') {
    if (playList[currentSong].isPlaying() ) {
      playList[currentSong].play();
    } else {
      playList[currentSong].pause();
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
