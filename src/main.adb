with deliverySystem; use deliverySystem;
with Ada.Calendar; use Ada.Calendar;
with inputController; use inputController;
with EEGOutputController; use EEGOutputController;
with ECGOutputController; use ECGOutputController;

-- ## Contains two concurrent tasks to start the system

procedure Main is --change name

   task ecgData;

   -- # A continous loop that reads, processes and outputs the data for the patients Heart Rate
   -- and whether the Tocsin is to be sounded.
   task body ecgData is

      ecgPeriod : Duration := 1.0;
      Start_Time : Time := Clock;
      ecgNext_Time : Time := Start_Time + ecgPeriod;
      ecgR: ecgReadings;
      ecgRAr: dataArray;
      readFrom: String := "hrReadings.txt";
      noOfElements: Natural := ecgReadingsSize'Last;

   begin

      loop
         -- Wait from X amount of seconds, then read data
         delay until ecgNext_Time;
         ecgNext_Time := ecgNext_Time + ecgPeriod;

         -- Read data from file
         ecgRAr := readFile(readFrom, noOfElements);

         -- Transfer to ecgReadings array
         for i in ecgReadingsSize loop

            ecgR(i) := ecgRAr(i);

         end loop;

         -- Write the output
         writeECGOutput(ecgR);

         -- Generate new data
         generateECGData(readFrom);

      end loop;

   end ecgData;

   task eegData;

   -- # A continous loop that reads, processes and outputs the data regarding the patients Suppression time
   -- and if they are being infused with medicine.
   task body eegData is

      eegPeriod : duration := 10.0;
      Start_Time : Time := Clock ;
      eegNext_Time : Time := Start_Time + eegPeriod;
      eegR: eegReadings;
      eegRAr: dataArray;
      readFrom: String := "eegReadings.txt";
      noOfElements: Natural := eegReadingsSize'Last;

   begin
      loop

         delay until eegNext_Time;

         -- Wait from X amount of seconds, then read data
         delay until eegNext_Time;
         eegNext_Time := eegNext_Time + eegPeriod;

         -- Read data from file
         eegRAr := readFile(readFrom, noOfElements);

         -- Transfer to ecgReadings array
         for i in eegReadingsSize loop

            eegR(i) := eegRAr(i);

         end loop;

         -- Write the output
         writeEEGOutput(eegR);

         -- Generate new data
         generateEEGData(readFrom);

         eegNext_Time := eegNext_Time + eegPeriod;

      end loop;

   end eegData;


begin

  null;

end Main;
