//Stimulus Parameters
//*******************
int[] window_borders = {700, 700}; //window size in pixels
int[] stim_area= {600,600};  //area within which spots will fall
int[] Frame={1050,250};     //fix frame location for repeatable stimulation
int window_intensity=0;   //background intensity
int fps=60;               //frame rate to update screen
//*******************

//Spots displayed
//*******************
int spots=3;              //No. of spots per frame
int spot_size= 40;        //Spot size in pixels
int intensity= 250;       //Gray level of the spot in an 8 bit scale
float interval=3;        //interval between two noise frames in seconds
float duration=2.95;       //noise dot on duration in seconds
int timethen=millis();  //store time of start
int timedur=0;            //store time of flash beginning
int state=0;              //toggles state of stimulus dot
//*******************


//Grid features
//*******************
int[] randX;
int[] randY;


int[] x = new int[spots]; //never ever mess with this!
int[] y = new int[spots]; //never ever mess with this! 
int[] row;                //selects the row from the random_seed file
int count = -1;


void setup() {
  size(window_borders[0], window_borders[1]);
  smooth();
  frameRate(fps);            
  background(window_intensity);
  noStroke();  
  fill(intensity);
  
  String[] dataX=loadStrings("randX.txt"); 
  randX = int(split(dataX[0],','));
  String[] dataY=loadStrings("randY.txt"); 
  randY = int(split(dataY[0], ','));
  
}

void draw() {
//String[] random_seed = loadStrings("rand.txt"); //It is a 100x1000 matrix
//println(millis()); 
frame.setLocation(Frame[0],Frame[1]);
background(window_intensity);

 
int timenow=millis();

if(timenow-timethen>=interval*1000)
{timethen=timenow;
timedur=millis();
state=intensity;

  
if (4 == count) {
      count = -1;
      delay(0);
    }
    count = count + 1;
    println(count);
    
     
       for (int i = 0; i < spots; i = i+1) {        
       x[i]=int(randX[i + spots*count]*spot_size);
       y[i]=int(randY[i + spots*count]*spot_size);
       
}
}  


if(timenow-timedur>=duration*1000)
{state=window_intensity;}
fill(state);

for (int j = 0; j < spots; j = j+1) {
    rect(x[j],y[j],spot_size,spot_size);
}

}



