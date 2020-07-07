package deliverySystem with SPARK_Mode is
   
   pragma Assertion_Policy (Pre => Check); -- Turn on precondition checks
   pragma Warnings (off); --looks cleaner
  
   TOCSIN_MINIMUM_BPM: constant Integer := 45;
   TOCSIN_MAXIMIM_BPM: constant Integer := 150;
   MINIMUM_ST: constant Integer := 9;
   MINUTE: Constant Integer := 60;
   CONVERT_TO_SECONDS: Constant Integer := 10;
   
   subtype ecgReadingsSize is Natural range 1..3;
   subtype eegReadingsSize is Natural range 1..10;
   subtype eegReading is Natural range 0..1; -- eegRReading is 0 or 1
   subtype ecgReading is Natural range 2..600; -- Max heart rate 220

   
   type ecgReadings is array (ecgReadingsSize) of ecgReading;
   type eegReadings is array (eegReadingsSize) of eegReading;
   type eegPartialSums is array (eegReadingsSize) of Natural;
   
   Tocsin: Boolean := false; -- make privtae and creatre method
   InfusionPump: Boolean := false;
   
   MAXIMUM_BPM: constant Natural := ((MINUTE/ecgReading'First) * CONVERT_TO_SECONDS);
   MINIMUM_BPM: constant Natural := ((MINUTE/ecgReading'Last) * CONVERT_TO_SECONDS);
   
   -- ## Functions ##
   
   -- # Calculates the AVG number of Beats Per Minute (BPM) using the last 3 Time Between Beats Readings (Deciseconds)
   --   For example: (10,10,10) = 60 BPM
   function CalcBPM(ecgR: in ecgReadings) return Natural -- Calculates the patients BPM
     with
       pre => (for all L in ecgR'First .. ecgR'Last => (ecgR(L) >= ecgReading'First and then ecgR(L) <= ecgReading'Last)),
       post =>  CalcBPM'Result >= MINIMUM_BPM and then CalcBPM'Result <= MAXIMUM_BPM; 
   
   
   -- # Calculates the number of seconds the brain is in a suppressed state (indicated by a 1)
   --  For example: (0,0,0,0,0,0,0,0,1,0) = 1 second
   function CalcST(eegR: in eegReadings) return Natural -- Calculates time between brain activity
     with
       pre => (for all L in 1 .. eegR'Last => (eegR (L) = 0 OR eegR (L) = 1)),  
       post => CalcST'Result  = sumEEGR (eegR) (eegR'Last);
 
   
   -- # Decides if to sound the Tocsin
   -- For example: bpm = 60 will return FALSE 
   function IsSoundTocsin(bpm: in Integer)  return Boolean 
     with                                      
       pre => bpm <= MAXIMUM_BPM and then bpm >= MINIMUM_BPM,
       post => IsSoundTocsin'Result = (if bpm < TOCSIN_MINIMUM_BPM or bpm > TOCSIN_MAXIMIM_BPM then true else false);
   
   
   -- # Decides if to infuse patient with medicine
   -- For example: supT = 9 will return false
   function IsInfuse(supT: in Integer) return Boolean -- Decides if patient needs more drugs
     with
       pre => (supT >= 0 and then supT <= eegReadings'Last), 
       post => IsInfuse'Result = (if supT < MINIMUM_ST then true else false); --sme

   
   -- # Auxillary function Ghost function which sums the values of an array to produce the supression time
   function sumEEGR (eegR : in eegReadings) return eegPartialSums with Ghost,
       Pre  =>  (eegR'Length > 0)
       and then (for all L in 1 .. eegR'Last => (eegR (L) = 0 OR eegR (L) = 1)),
       Post =>  (sumEEGR'Result'Length = eegR'Length) 
       and then (sumEEGR'Result'First = eegR'First) 
       and then (for all I in eegR'First .. eegR'Last =>
         (sumEEGR'Result (I)) <= I * eegReadings'Last) --10 * 10
       and then (sumEEGR'Result (eegR'First) = eegR (eegR'First))
       and then (for all I in eegR'First + 1 .. eegR'Last =>
         sumEEGR'Result (I) = sumEEGR'Result (I - 1) + eegR (I));
 
end deliverySystem;


