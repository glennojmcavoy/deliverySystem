with deliverySystem; use deliverySystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure testDeliverySystem with SPARK_Mode is

   ecgR   : ecgReadings := (10,10,10); -- Desisecond seconds 
   eegR : eegReadings := (0,0,0,0,0,0,0,0,0,1);
   bpm : Natural := 0;
   st : Integer := 0;

begin

   
   bpm := CalcBPM(ecgR);
   
   Put_Line("BPM: " & Natural'Image(bpm));
   
   st := CalcST(eegR);
   
   Put_Line("Suppression Time: " & Integer'Image(st));
   
   --sound := IsSoundTocsin((bpm));

 --  Put_Line("Sound Tocsin?: " & Boolean'Image(sound));
   
  -- infuse := IsInfuse(st);

  -- Put_Line("Infuse?: " & Boolean'Image(infuse));
  
end testDeliverySystem;
