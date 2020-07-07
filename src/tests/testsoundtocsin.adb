with deliverySystem; use deliverySystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure testSoundTocsin is


   bpm : Integer := 223;
 
begin
   
   Put_Line("Sound: " & Boolean'Image(IsSoundTocsin(bpm)));

        
end testSoundTocsin;
