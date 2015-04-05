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

set PROXY_HOST 
set PROXY_PORT
set PROXY_USER 
set PROXY_PASS
set PROXY_PS   "*$ "

set JUMP_HOST 
set JUMP_PORT 
set JUMP_USER 
set JUMP_PASS 
set JUMP_PS   "*$ "

# proxy
spawn -noecho ssh -q $PROXY_USER@$PROXY_HOST -p$PROXY_PORT

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
                send "$PROXY_PASS\n"
                expect {
                    # now in proxy
                    "$PROXY_PS"
                    {
                        # go to jumper
                        send "ssh -q $JUMP_USER@$JUMP_HOST -p$JUMP_PORT\n"
                        expect {
                            "*(yes/no)?"
                            {
                                send "yes\n"
                                expect {
                                    "*(yes/no)?"
                                    {
                                        send "yes\n"
                                        expect "*assword:"
                                        send "$JUMP_PASS\n"
                                    }
                                    "*assword:"
                                    {
                                        send "$JUMP_PASS\n"
                                        expect {
                                            "$JUMP_PS"
                                            {
                                                # go to host
                                                send "ssh -q $USER@$HOST -p$PORT\n"
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
                                                        send   "$PASS\n"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            "*assword:"
                            {
                                send   "$JUMP_PASS\n"
                                expect {
                                    "$JUMP_PS"
                                    {
                                        # go to host
                                        send "ssh -q $USER@$HOST -p$PORT\n"
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
                                                send   "$PASS\n"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            "*assword:"
            {
                send "$PROXY_PASS\n"
                expect {
                    # now in proxy
                    "$PROXY_PS"
                    {
                        # go to jumper
                        send "ssh -q $JUMP_USER@$JUMP_HOST -p$JUMP_PORT\n"
                        expect {
                            "*(yes/no)?"
                            {
                                send "yes\n"
                                expect {
                                    "*(yes/no)?"
                                    {
                                        send "yes\n"
                                        expect "*assword:"
                                        send "$JUMP_PASS\n"
                                    }
                                    "*assword:"
                                    {
                                        send "$JUMP_PASS\n"
                                        expect {
                                            "$JUMP_PS"
                                            {
                                                # go to host
                                                send "ssh -q $USER@$HOST -p$PORT\n"
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
                                                        send   "$PASS\n"
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            "*assword:"
                            {
                                send   "$JUMP_PASS\n"
                                expect {
                                    "$JUMP_PS"
                                    {
                                        # go to host
                                        send "ssh -q $USER@$HOST -p$PORT\n"
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
                                                send   "$PASS\n"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    "*assword:"
    {
        send "$PROXY_PASS\n"
        expect {
            # now in proxy
            "$PROXY_PS"
            {
                # go to jumper
                send "ssh -q $JUMP_USER@$JUMP_HOST -p$JUMP_PORT\n"
                expect {
                    "*(yes/no)?"
                    {
                        send "yes\n"
                        expect {
                            "*(yes/no)?"
                            {
                                send "yes\n"
                                expect "*assword:"
                                send "$JUMP_PASS\n"
                            }
                            "*assword:"
                            {
                                send "$JUMP_PASS\n"
                                expect {
                                    "$JUMP_PS"
                                    {
                                        # go to host
                                        send "ssh -q $USER@$HOST -p$PORT\n"
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
                                                send   "$PASS\n"
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    "*assword:"
                    {
                        send   "$JUMP_PASS\n"
                        expect {
                            "$JUMP_PS"
                            {
                                # go to host
                                send "ssh -q $USER@$HOST -p$PORT\n"
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
                                        send   "$PASS\n"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

interact  

