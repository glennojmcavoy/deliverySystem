package body extra is

       function SegmentEEG(rED: in rawEEGReadings) return eegReadings is
     
     segmentedReadings : eegReadings;
     
    begin
      
      for i in rED'First.. rED'Last loop      
         
         if rED(i) > VOLTAGE_THRESHOLD
           
           then segmentedReadings(i) := 1;
            
           else segmentedReadings(i) := 0;
            
         end if;
         
      end loop;
     
     return segmentedReadings;
   
    end SegmentEEG;

end extra;
