with deliverySystem; use deliverySystem;

package ECGOutputController is

   procedure writeECGOutput(ecgR : ecgReadings);
   
   procedure generateECGData(Read_From : String);
   

end ECGOutputController;
