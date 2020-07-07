with deliverySystem; use deliverySystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure testIsInfuse is

   st : Integer := -1;
   
begin

   Put_Line(Integer'Image(eegReadings'First));

   Put_Line("Infuse: " & Boolean'Image(IsInfuse(st)));
        
end testIsInfuse;
