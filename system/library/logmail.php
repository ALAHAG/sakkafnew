<?php


 Function Log_Mail($header_log, $to_log, $subject_log, $message_log, $parameter_log, $html, $from_log)
 {
     $Output_Log = true;
     $Line_End = "\n";
     $Message_Type = "HTML";
     $Start_End_Display = "**********************************************************************************************************************************";

       If($Output_Log)//Log file set to true
       {
            $File_Log_Name = "Mail_Log.txt";//File Name
            $Log_File = fopen($_SERVER['DOCUMENT_ROOT'] . "/system/logs/" . $File_Log_Name, "a+");//create if doesn't exist otherwise append
            $Log_Time_Start = date("l dS \of F Y h:i:s A"); //Log time started

                if (!$parameter_log)
                {
                    $parameter_log = "None Set";
                }

                if (!$html)
                {
                    $Message_Type = "TEXT";
                }
            $New_Line_Start = $Start_End_Display . "\n******** Created: " . $Log_Time_Start . "     Message Type: " . $Message_Type . "     Parameter :" . $parameter_log . $Line_End . $Start_End_Display . $Line_End;
            Fwrite($Log_File, $New_Line_Start);//Write to file to begin

            //Logging
            $Log_Line = $header_log;
            $Log_Line .= "TO: " . $to_log . $Line_End;
            //$Log_Line .= "FROM: " . $from_log . $Line_End;
            $Log_Line .= "SUBJECT: " . $subject_log . $Line_End;
            $Log_Line .= $message_log . $Line_End;
            $Log_Line .= $Start_End_Display . $Line_End . $Line_End;

            Fwrite($Log_File, $Log_Line);//Write remaining Log

            fclose($Log_File);//Close File handle for Log File
    }
 }//End Function Log_Mail

?>
