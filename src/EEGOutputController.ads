with deliverySystem; use deliverySystem;

package EEGOutputController is

    procedure writeEEGOutput(eegR : eegReadings);
    
    procedure generateEEGData(readFrom : String);

end EEGOutputController;
