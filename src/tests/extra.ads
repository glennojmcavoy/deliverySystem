package extra is

      function SegmentEEG(rED: in rawEEGReadings) return eegReadings -- Calculates the patients BPM
     with
       post => (for all L in 0 .. SegmentEEG'Result'Last => 
               (SegmentEEG'Result (L) = 0 OR SegmentEEG'Result (L) = 1));

end extra;
