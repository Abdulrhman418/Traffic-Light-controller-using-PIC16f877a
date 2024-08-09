#define flag portb.b4

void display(char count){
    int right =0, left =0;
    left =count/10;
    right =count%10;
    portb.b2 =1;
    Portb.b3 =0;
    portc =right;
    delay_ms(10);
    portb.b2 =0;
    portb.b3 =1;
    portc =left;
    delay_ms(10);
}

void  Manual(){
      signed char count =0; char s=0;
      for(;;){
         portd =0b010001;
          for( count =3; count>=0; count--){
                for(s =0; s <=50; s++){
                     display(count);
                     if(flag ==0){
                       return;
                     }
                }
          }
          portd =0b100001;
          while(portb.b1 !=1){
             if(flag ==0){ return; }
          }
          portd =0b001010;
          for( count =3; count>=0; count--){
                for(s =0; s <=50; s++){
                     display(count);
                     if(flag ==0){
                       return;
                     }
                }
          }
          portd =0b001100;
          while(portb.b1 !=1){
             if(flag ==0){ return; }
          }
      }

}

void interrupt(){
     if(INTF_bit ==1){
          INTF_bit =0;
          flag =~flag;
     }
}

void main(){
     trisb =0b00000011; portb.B2 =0; portb.B3 =0; flag =0;
     trisc =0; portc =0;
     trisd =0; portd =0;
     GIE_bit =1;
     INTE_bit =1;
     INTEDG_bit =1;

     for(;;){
          char s =0; signed char count =0;
          portd =0b010001;
          for( count =23; count>=0; count--){
                 if(count ==20){
                   portd =0b100001;
                }
                for(s =0; s <=50; s++){
                   display(count);
                   if(flag ==1){
                       Manual();
                   }
                }
              }
          portd =0b001010;
          for( count =15; count>=0; count--){
                if(count ==12){
                  portd =0b001100;
                }
                for(s =0; s <=50; s++){
                   display(count);
                   if(flag ==1){
                       Manual();
                   }
                }
          }
        }

}




          
       