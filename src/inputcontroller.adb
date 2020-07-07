with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with FileManager; use FileManager;

package body InputController is
   
   -- Name of output file
   Write_To: String := "output.txt";
   --Output, Input : File_Type;
   
   -- Real data from file and returns an array of numbers
   function readFile(readFrom : String; noOfElements : Natural) return dataArray is
   
      counter: Integer := 1;
      data: dataArray;
   
   begin
      -- # Method to open the input file for reading

      initializeInput(readFrom);
      
      loop
   
         declare
            -- Read data from Input file
            Line : String := Get_Line (Input);
         begin
            
            data(counter) := Integer'Value(Line);
            
            if counter = noOfElements 
            then    
               
               -- Deletes old input file so new one can be created
               Delete(Input);
               return data;
               
            end if;  
            
            counter := counter + 1;
            
            end;
         end loop;
   
      exception
         when End_Error =>
            if Is_Open(Input) then
               Close (Input);
               return data;
            end if;
            
      end readFile;
       
end InputController;
