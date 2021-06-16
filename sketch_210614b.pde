//creating snake
ArrayList<Integer>x_pos=new ArrayList<Integer>();
ArrayList<Integer>y_pos=new ArrayList<Integer>();

int hgt=24,wdt=24;  //size of snake
int block=20;
int dir=2;               //0-down,1-up,2-right,3-left
int []x_dir={0,0,1,-1};  //up down left right
int []y_dir={1,-1,0,0};   
int fx_pos=15; //position of food
int fy_pos=15;
boolean gamestatus=false;  //game is running
int speed=10;

void setup(){  //initial position of snake
  size(1000,1000);  //window size
  x_pos.add(4);
  y_pos.add(15);
}

//creating snake
void draw(){
  background(17, 207, 83);
  fill(255);

  for(int i=0;i<x_pos.size();i++)
    rect(x_pos.get(i)*block,y_pos.get(i)*block,block,block);
  
    //positioning scoreboard
    textAlign(LEFT);
    textSize(25);
    fill(255);
    text("Your Score: " +x_pos.size(),10,30);
    
    
    
    //Snake Food
    if(!gamestatus)
    {
      fill(252, 13, 41);
      rect(fx_pos*block,fy_pos*block,block,block);
        
   //moving snake 
  if(frameCount%speed==0)  //only one element is present frame count=60
  {   
    x_pos.add(0,x_pos.get(0)+x_dir[dir]);
    y_pos.add(0,y_pos.get(0)+y_dir[dir]); 
    //snake touches border
    if(x_pos.get(0)<0 || y_pos.get(0)<0||x_pos.get(0)>wdt||y_pos.get(0)>hgt)
    {
      gamestatus=true;
    }
    //snake touches itself
   // for(int i=1;i<x_pos.size();i++)
    //{
      //if(x_pos.get(0)==x_pos.get(i) && y_pos.get(0)==y_pos.get(i))
        //gamestatus=true;
    //}

    //making snake to eat and creating random positions fo food
    if(x_pos.get(0)==fx_pos && y_pos.get(0)==fy_pos)  //postion of snake=position of food
    {
      if(x_pos.size()%2==0&&speed>=2){   //increase speed after snake eats food
        speed=speed-1;
      }
        fx_pos=(int)random(0,wdt);
        fy_pos=(int)random(0,hgt);
    }
    else
    {
       x_pos.remove(x_pos.size()-1);  //single block of snake will move(snake length will not increase
       y_pos.remove(y_pos.size()-1);
    }
  }
  }
  else{
    //display the score
    fill(15, 14, 14);
    textAlign(CENTER);
    textSize(45);
    text("GAME OVER :( \n Score: " +x_pos.size() + "\n Press Enter to Play Again!!!",1000/2,1000/2);
    if(keyCode==ENTER)
      {
        x_pos.clear();
        y_pos.clear();
        x_pos.add(4);
        y_pos.add(15);
        dir=2;
        speed=10;
        gamestatus=false;
      }
    }
}

//controlling snake
void keyPressed()
{
  int new_dir = keyCode;
  if(keyCode==DOWN)
    new_dir=0;
  else if(keyCode==UP)
    new_dir=1;
  else if(keyCode==LEFT)
    new_dir=3;
  else if(keyCode==RIGHT)
    new_dir=2;      
  else
    new_dir =-1;
  if(new_dir!=-1)
    dir=new_dir;         
} 
