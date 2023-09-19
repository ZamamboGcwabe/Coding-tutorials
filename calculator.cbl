       DENTIFICATION DIVISION.
       PROGRAM-ID. CalculatorProgram.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Operand1     PIC 9(5).
       01 Operator     PIC X.
       01 Operand2     PIC 9(5).
       01 Result       PIC 9(10).
       01 Input        PIC X(10).
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
                   When "/"
                           IF Operand2 = 0
                                   DISPLAY "Division by zero not allowed"
                           ELSE
                                   COMPUTE Result = Operand1 / Operand2
                           END-IF
                   WHEN OTHER
                           DISPLAY "Invalid operator"
           END-EVALUATE

           DISPLAY "Result: " Result.

           DISPLAY "Do you want to perform another calculation? (Y/N): "
ACCEPT Choice.

           IF Choice = "Y" OR "y"
                   THEN
                           GO TO PROGRAM-ID.
                   ELSE
                           DISPLAY "Goodbye"
                           STOP RUN.
           END-IF
