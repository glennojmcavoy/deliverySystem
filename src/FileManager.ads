with Ada.Text_IO; use Ada.Text_IO; with Ada.Command_Line; use
Ada.Command_Line;

package FileManager is

   Output, Input : File_Type;

   procedure initializeInput(readFrom : String);

   procedure initializeOutput(writeTo : String);

   procedure initializeNewInput(readFrom : String);

end FileManager;
