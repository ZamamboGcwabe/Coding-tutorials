       IDENTIFICATION DIVISION.
       PROGRAM-ID. CalculatorProgram.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Operand1     PIC 9(5).
       01 Operator     PIC X.
       01 Operand2     PIC 9(5).
       01 Result       PIC 9(10).
       01 Choice       PIC X.

       PROCEDURE DIVISION.
               DISPLAY "Simple Calculator".
               DISPLAY "Enter the first operand: ".
               ACCEPT Operand1.
               DISPLAY "Enter operator (+, -, *, /): ".
               ACCEPT Operator.
               DISPLAY "Enter second operand: ".
               ACCEPT Operand2.

               COMPUTE Result = 0.

               EVALUATE Operator
                       WHEN "+"
                               COMPUTE Result = Operand1 + Operand2
                       WHEN "-"
                               COMPUTE Result = Operand1 - Operand2
                       WHEN "*"
                               COMPUTE Result = Operand1 * Operand2
                       WHEN "/"
                               IF Operand2 = 0
                                       DISPLAY "Division by 0 NULL"
                               ELSE
                                    COMPUTE Result = Operand1 / Operand2
                               END-IF
                       WHEN OTHER 
                               DISPLAY "Invalid operator"
               END-EVALUATE
               
               DISPLAY "Result: " Result.
           
               DISPLAY "Continue? (Y/N)".
               ACCEPT Choice.
           
               IF Choice = "Y" OR Choice = "y" THEN
                       PERFORM Program-Restart
                   ELSE
                           DISPLAY "Goodbye".
               STOP RUN.

       Program-Restart.
           INITIALIZE Operand1 Operator Operand2 Result Choice.
