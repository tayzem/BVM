@echo off

setlocal enabledelayedexpansion

rem Request input for the BVM file name
set /p "bvm_file=Enter the BVM file: "

if not exist "%bvm_file%" (
    echo File "%bvm_file%" does not exist.
    exit /b 1
)

rem Initialize register R1-R9

set "R1=0"
set "R2=0"
set "R3=0"
set "R4=0"
set "R5=0"
set "R6=0"
set "R7=0"
set "R8=0"
set "R9=0"

rem Load the example BVM file into memory (variables)
set "linenum=0"

for /f "tokens=*" %%a in (%bvm_file%) do (
    set /a linenum+=1
    set "line[!linenum!]=%%a"
)

rem Initialize the program counter
set "pc=1"

rem Do a loop in each line to store labels into variables

for /f "tokens=*" %%a in ('type "%bvm_file%"') do (
    set /a pc+=1
    echo %%a | findstr /r "^[a-zA-Z0-9_][a-zA-Z0-9_]*:" >nul
    if not errorlevel 1 (
        for /f "tokens=1 delims=:" %%f in ("%%a") do (
            set "label_%%f=!pc!"
        )
    )
)

set "pc=1" & rem Reset the program counter to 1

rem Print the loaded lines
for /l %%i in (1,1,!linenum!) do (
    rem Basic hack to get the current line
    for /f "tokens=*" %%a in ("!pc!") do (
        set "current_line=!line[%%a]!"
    )

    set /a pc+=1

    rem Split the current line into command, operand1 and operand2
    for /f "tokens=1,2,3 delims= " %%b in ("!current_line!") do (
        set "command=%%b"
        set "operand1=%%c"
        rem Remove , from operand1 if it exists
        if defined operand1 (
            set "operand1=!operand1:,=!"
        )
        set "operand2=%%d"
    )

    rem Handle SUB, ADD, MOV, PRN, and HLT commands
    if "!command!"=="MOV" (
        rem This is a hack to get the source and destination registers
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Destination register is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Destination register is not defined.
                exit /b 1
            )
        )
        for /f "tokens=1" %%e in ("!operand2!") do (
            if not defined operand2 (
                echo Source operand is not defined.
                exit /b 1
            )

            if defined %%e (
                set "src=!%%e!"
                set "src_name=!operand2!"
            ) else (
                set "src=!operand2!"
                set "src_name=!operand2!"
            )
        )
        
        set "!dest_name!=!src!"
    )

    if "!command!"=="ADD" (
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Destination register is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Destination register is not defined.
                exit /b 1
            )
        )
        for /f "tokens=1" %%e in ("!operand2!") do (
            if not defined operand2 (
                echo Source operand is not defined.
                exit /b 1
            )

            if defined %%e (
                set "src=!%%e!"
                set "src_name=!operand2!"
            ) else (
                set "src=!operand2!"
                set "src_name=!operand2!"
            )
        )

        set /a !dest_name!=!dest_name! + !src!
    )

    if "!command!"=="SUB" (
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Destination register is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Destination register is not defined.
                exit /b 1
            )
        )
        for /f "tokens=1" %%e in ("!operand2!") do (
            if not defined operand2 (
                echo Source operand is not defined.
                exit /b 1
            )

            if defined %%e (
                set "src=!%%e!"
                set "src_name=!operand2!"
            ) else (
                set "src=!operand2!"
                set "src_name=!operand2!"
            )
        )

        set /a !dest_name!=!dest_name! - !src!
    )

    if "!command!"=="MUL" (
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Destination register is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Destination register is not defined.
                exit /b 1
            )
        )
        for /f "tokens=1" %%e in ("!operand2!") do (
            if not defined operand2 (
                echo Source operand is not defined.
                exit /b 1
            )

            if defined %%e (
                set "src=!%%e!"
                set "src_name=!operand2!"
            ) else (
                set "src=!operand2!"
                set "src_name=!operand2!"
            )
        )

        set /a !dest_name!=!dest_name! * !src!
    )

    if "!command!"=="DIV" (
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Destination register is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Destination register is not defined.
                exit /b 1
            )
        )
        for /f "tokens=1" %%e in ("!operand2!") do (
            if not defined operand2 (
                echo Source operand is not defined.
                exit /b 1
            )

            if defined %%e (
                set "src=!%%e!"
                set "src_name=!operand2!"
            ) else (
                set "src=!operand2!"
                set "src_name=!operand2!"
            )
        )

        set /a !dest_name!=!dest_name! / !src!
    )

    if "!command!"=="PRN" (
        for /f "tokens=1" %%e in ("!operand1!") do (
            if not defined operand1 (
                echo Operand to print is not defined.
                exit /b 1
            )

            set "dest=!%%e!"
            set "dest_name=!operand1!"

            if not defined dest (
                echo Operand to print is not defined.
                exit /b 1
            )
        )

        echo !dest!
    )

    rem Check if the command is JMP

    if "!command!"=="JMP" (
        rem This is a hack to get the label name
        for /f "tokens=1" %%g in ("!operand1!") do (
            set "label_name=label_%%g"
            set "label=!label_%%g!"

            if not defined label (
                echo Label %%g is not defined.
                exit /b 1
            )

            set /a pc=label
        )
    )

    if "!command!"=="HLT" (
        exit /b !R1!
    )
)