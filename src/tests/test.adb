with SPARK_IO; use SPARK_IO;
procedure test (File         :    out File_Type;
                  Mode_Of_File : in     File_Mode;
                  Name_Of_File : in     String;
                  Form_Of_File : in     String;
                  Status       :    out File_Status)
  is
    Fmode : Ada.Text_IO.File_Mode;
  begin
    case Mode_Of_File is
      when In_File     => Fmode := Ada.Text_IO.In_File;
      when Out_File    => Fmode := Ada.Text_IO.Out_File;
      when Append_File => Fmode := Ada.Text_IO.Append_File;
    end case;
    Status := Ok;
    File.File := new Ada.Text_IO.File_Type;
    Ada.Text_IO.Open( File.File.all, Fmode, Name_Of_File, Form_Of_File);
  exception
    when Ada.Text_IO.Status_Error  => Status := Status_Error;
    when Ada.Text_IO.Name_Error    => Status := Name_Error;
    when Ada.Text_IO.Use_Error     => Status := Use_Error;
    when Ada.Text_IO.Device_Error  => Status := Device_Error;
    when Standard.Storage_Error    => Status := Storage_Error;
    when Standard.Program_Error    => Status := Program_Error;

end test;
