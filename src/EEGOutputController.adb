with ada.numerics.discrete_random;
with FileManager; use FileManager;
with Ada.Text_IO; use Ada.Text_IO;


package body EEGOutputController is

   -- Used to produce new data
   package Rand_Int is new ada.numerics.discrete_random(eegReading);
   use Rand_Int;
   gen : Generator;
   num : eegReading;
   Write_To: String := "output.txt";
   st: Natural := 0;
   
   -- Writes the patients suppression time and relevant data to an output file
   procedure writeEEGOutput(eegR : eegReadings) is
   begin
   
      initializeOutput(Write_To);
   
      -- Output relevant data
      st := CalcST(eegR); -- Calculate ST using the readings
      Put_Line (Output, "ST: " & Integer'Image(st));
      Put_Line(Output, "Infusing?: " & Boolean'Image(IsInfuse(st)));
      Put_Line(Output, "");
   
      Close (Output);
   
   end writeEEGOutput;
     
   -- Creates random EEG data so that the system has a constant stream of data
   procedure generateEEGData(readFrom : String) is
   begin 
      
      initializeNewInput(readFrom);
      
      -- Generate new input data and add to newly created file
      for i in eegReadingsSize'First .. eegReadingsSize'Last loop
         reset(gen);
         num := random(gen);
         put_line(Input, eegReading'Image(num));
      end loop;
            
      Close(Input);
            
   end generateEEGData;

end EEGOutputController; 

