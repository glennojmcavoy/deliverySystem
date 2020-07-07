  package body FileManager is

   --## This package acts as a file manager.
   -- It creates files
   -- Reads files
   -- Writes to files

   -- # Takes file name as input and opens it ready for reading
   procedure initializeInput(readFrom : String) is
   begin
      begin
         Open (File => Input,
               Mode => In_File,
               Name => readFrom);
      exception
         when others =>
            Put_Line (Standard_Error,
                      "Can not open: '" & readFrom & "'. Does it exist?");
            Set_Exit_Status (Failure);
            return;
      end;

   end initializeInput;

-- Takes file name as input. If file exists, open file. Else it create new file named using File name provided
   procedure initializeOutput(writeTo : String) is
   begin
      begin
         Open (File => Output,
                 Mode => Append_File,
                 Name => writeTo);
      exception
         when others =>
            begin
      Create (File => Output,
              Mode => Out_File,
              Name => writeTo);
   exception
      when others =>
         Put_Line (Standard_Error,
                   "Can not create a file named '" & writeTo & "'.");
         Set_Exit_Status (Failure);
         return;
      end;
    end;
   end initializeOutput;

-- Takes file name provided as string and creates new file with this name
   procedure initializeNewInput(readFrom : String) is
   begin
      begin
         Create (File => Input,
                 Mode => Append_File,
                 Name => readFrom);
      exception
         when others =>
            Put_Line (Standard_Error,
                      "Can not create new test data");
            Set_Exit_Status (Failure);
            return;
      end;

   end initializeNewInput;

  end FileManager;
