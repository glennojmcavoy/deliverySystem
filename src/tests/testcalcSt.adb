with deliverySystem; use deliverySystem;
with Ada.Text_IO; use Ada.Text_IO;

procedure testCalcST is
 
   readings   : constant eegReadings := (1,1,1,1,1,1,1,1,1,1);
   

begin

   Put_Line("BST: " & Integer'Image(CalcST(readings)));

end testCalcST;
