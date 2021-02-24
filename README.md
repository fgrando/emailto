# emailto
Python script to send emails via command line.
So far I tested with Gmail on linux.


# Configuration is done in first use
```sh
fgrando@thinkx:$ emailto
Configuration not valid!
Running first use configuration...

Type the sender email address  (email@web.com): myemail@gmail.com
Type the sender email password (the_P@$$W0rd1): <supersecretpass>
Default email recipients used when not provided by command line ("email1@me.com,email2@web.com"): adminemail@gmail.com

{'login': 'myemail@gmail.com', 'passwd': '******************', 'default_recipients': 'adminemail@gmail.com'}
This configuration is going to be written at /home/fgrando/.emailto. Proceed? [N/y]:y
```

Then after that, you can use it normally...



# Usage example
```sh
fgrando@thinkx:$ emailto -s somesubject -m themessage -v
fgrando@thinkx:$ emailto --help
usage: emailto [-h] -s SUBJECT -m MESSAGE [-r RECIPIENTS] [-a ATTACHMENTS] [-v]

optional arguments:
  -h, --help            show this help message and exit
  -s SUBJECT, --subject SUBJECT
                        Subject of the email
  -m MESSAGE, --message MESSAGE
                        Message of the email (content)
  -r RECIPIENTS, --recipients RECIPIENTS
                        Comma separated list of email recipients: "email1@asdf.com,email2@asdf.com". Default recipients are used if this is not provided.
  -a ATTACHMENTS, --attachments ATTACHMENTS
                        Comma separated list of file paths to be attached like: "/home/user/msg.txt,/home/user/other.png"
  -v, --verbose         Verbose mode. Show debug messages about the process
```



