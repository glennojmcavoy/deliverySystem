with deliverySystem; use deliverySystem;

package InputController is

   type dataArray is array(1..10) of Natural;
   
   function readFile(readFrom : String; noOfElements: Natural) return dataArray;
  
end InputController;
