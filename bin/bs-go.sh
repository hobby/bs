#!/usr/bin/expect --

#
# brief: ssh to host@port with user and pass, then
#        execute one cmd before interact;
#
# author: Hobby @ 2015.04
#

set HOST     [lindex $argv 0]
set PORT     [lindex $argv 1]
set USER     [lindex $argv 2]
set PASS     [lindex $argv 3]
set CMD      [lindex $argv 4]
set PS       "*$ "

set timeout -1

spawn -noecho ssh -q $USER@$HOST -p$PORT

expect {
    "*(yes/no)?"
    {
        send "yes\n"
        expect {
            "*(yes/no)?"
            {
                send   "yes\n"
                expect "*assword:"
                send   "$PASS\n"
                expect "$PS" 
                send   "$CMD\n"
            }
            "*assword:"
            {
                send   "$PASS\n"
                expect "$PS" 
                send   "$CMD\n"
            }
        }
    }
    "*assword:"
    {
        send   "$PASS\n"
        expect "$PS" 
        send   "$CMD\n"
    }
}

interact  

