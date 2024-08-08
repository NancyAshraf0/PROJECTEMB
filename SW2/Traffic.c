char i=0; char Ls=0;   char rights=0;  char  j=0;  char k=3; char rightw=0; char Lw=0;char a=0;  char x;
char nn;  char xx;
int manChar=0;    int mm=0;
char seg[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x67};
char leds[]={0b010001,0b100001,0b001010,0b001100};
#define reds portc.b0
#define yells portc.b1
#define greens portc.b2
#define redw portc.b3
#define yellw portc.b4
#define greenw portc.b5
void manualm(){
   if(manChar==2||manChar==0){
     portc=leds[manChar];
           manChar++;

           for(mm=3;mm>=1;mm--){
            x=mm%10;     xx=mm/10;
               for(nn=1;nn<=50;nn++){
                porte.b0=0;
                porta.B5=1;
                porte.b1=1;
                porta.b2=0;
                portb=x<<1;     portd=x;

                Delay_ms(10);

                porte.b0=1;
                porta.B5=0;
                porte.b1=0;
                porta.b2=1;
                portb=xx<<1;     portd=xx;
                Delay_ms(10);
              }
           }

     }
       portc=leds[manChar];
        porte=7;porta=63;
  }


  void interrupt(){
    if(INTF_bit==1 ){
      INTF_bit=0;
      if(portc.b7==0){
      if(manChar==3){manChar=0;}
      else{manChar++;}
      manualm();
      }
}
    }


void autoh(){
   while(portc.b7==1){
    manChar=0; k=3;portc=leds[manChar];  //yellw=1;
      for(i=23;i>0;i--){
          if(i==20){k=20;manChar++; portc=leds[manChar];}//greenw=1; yellw=0;
             for(j=0;j<50;j++){ if(portc.b7==0){return;}

                  rights=i%10;   rightw=k%10;
                  Ls=i/10;       Lw=k/10;
                  //reds=1; // South red
                  porta.B5=1;   portE.B1=1;                       //left segments off
                  porta.b2=0;   portE.B0=0;                       //Right segments on
                  portd=rights;        portb=rightw<<1;
                  Delay_ms(10);

                  porta.B5=0;   portE.B1=0;                       //left segments on
                  porta.b2=1;    portE.B0=1;                     //Right segments off
                  portd=Ls;     portb=Lw<<1;
                  Delay_ms(10);
            }
      k--;    if(k==0){k=1;}
      }
      // reds=0; greenw=0;
       k=3; manChar++;    portc=leds[manChar];// yells=1;
      for(i=15;i>0;i--){
          if(i==12){k=12;manChar++;portc=leds[manChar];}//greens=1;yells=0;
             for(j=0;j<50;j++){ if(portc.b7==0){return;}

                  rights=k%10;   rightw=i%10;
                  Ls=K/10;       Lw=i/10;
                  //redw=1;
                  porta.B5=1;   portE.B1=1;                       //left segments off
                  porta.b2=0;   portE.B0=0;                        //Right segments on
                  portd=rights;        portb=rightw<<1;
                  Delay_ms(10);

                  porta.B5=0;   portE.B1=0;                       //left segments on
                  porta.b2=1;    portE.B0=1;                      //Right segments off
                  portd=Ls;     portb=Lw<<1;
                  Delay_ms(10);

            }
             k--;
      } manChar=0;//redw=0;  greens=0;
}

}
void main() {
TRISB=0b00000001;PORTB=0;   GIE_bit=1;
   INTE_BIT=1;
   INTEDG_bit=1;
TRISE=0;PORTE=0;
TRISC=0b10000000;PORTC=0;
TRISA=0b000001;//PORTA=0;
TRISD=0;PORTD=0;


 while(1){
  if(portc.b7==1){autoh();}
  else{
manualm();}
}}