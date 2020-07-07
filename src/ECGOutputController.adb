with ada.numerics.discrete_random;
with deliverySystem; use deliverySystem;
with FileManager; use FileManager;
with Ada.Text_IO; use Ada.Text_IO;
with inputController; use inputController;

package body ECGOutputController is

   -- Used to produce new data
   -- subtype demo is Natural range 10 .. 10; -- for demo only
   package Rand_Int is new ada.numerics.discrete_random(ecgReading);
   use Rand_Int;
   gen : Generator;
   num : ecgReading;
   Write_To: String := "output.txt";
   bpm: Natural := 0;
   
   -- Generates new random ECG data to allow the system to have constant stream of data
   procedure generateECGData(Read_From : String) is
     
   begin
   
      initializeNewInput(Read_From);
      
      -- Generate new input data and add to newly created file
      for i in ecgReadingsSize'First .. ecgReadingsSize'Last loop
         reset(gen);
         num := random(gen);
         put_line(Input, ecgReading'Image(num));
      end loop;
   
      Close(Input);
   
   end generateECGData;
   
   
   -- Writes the patients BPM to an output file
   procedure writeECGOutput(ecgR : ecgReadings) is
      
   begin
   
      initializeOutput(Write_To);
        
      bpm := calcBPM(ecgR); -- Calculate BPM using the readings
      Put_Line(Output, "BPM:" & Integer'Image(bpm));
      Put_Line(Output, "Tocsin: " & Boolean'Image(IsSoundTocsin(bpm)));
      Put_Line(Output, "");
      
      Close(Output);
   
   end writeECGOutput;   


end ECGOutputController;
