#!/usr/bin/expect --
set HOST     [lindex $argv 0]
set PORT     [lindex $argv 1]
set USER     [lindex $argv 2]
set PASS     [lindex $argv 3]
set CMD	     [lindex $argv 4]

spawn -noecho ssh -q $USER@$HOST -p$PORT 

set timeout -1

expect {
    "*(yes/no)?"
    {
        send "yes\n"
        expect {
            "*(yes/no)?"
            {
                send "yes\n"
                expect "*assword:"
                send "$PASS\n"
            }
            "*assword:"
            {
                send "$PASS\n"
            }
        }
    }
    "*assword:"
    {
        send "$PASS\n"
    }
}

# expect or not expect is the same, so...
#expect "*$" 
send "$CMD\n"
interact  

