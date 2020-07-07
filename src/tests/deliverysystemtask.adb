with Ada.Calendar; use Ada.Calendar;
with ecgLoop; 
with eegLoop; 
package body deliverySystemTask is

   task body ecgData is
      
      Period : Duration := 1.0;
      Start_Time : Time := Clock ;
      Next_Time : Time := Start_Time + Period ;
      
   begin
      
      loop
       
         delay until Next_Time;
         Next_Time := Next_Time + period ;
         ecgLoop;
         
      end loop;   
      
   end ecgData;   
      
      
   task body eegData is
      
      Period : Duration := 10.0;
      Start_Time : Time := Clock ;
      Next_Time : Time := Start_Time + Period ;
      
   begin
      
      loop
       
         delay until Next_Time;
         Next_Time := Next_Time + period ;
         eegLoop;
         
      end loop;   
   
   end eegData;   

end deliverySystemTask;
