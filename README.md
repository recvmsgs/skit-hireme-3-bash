# skit-hireme-3-bash
DigitalOcean monitoring script written in Bash
  
  
INSTALLATION:  
  
- Overriding defaults in `config.sh`:  
`bash ./install.sh  SKIT_ALERT_EMAIL='recvmsgs@gmail.com' MAIL_FROM='skit.alerts@gmail.com' MAIL_PASS='nepoviemHesl0' SMTP_ADDR='smtp.gmail.com' SMTP_PORT='587'` (to override values in `config.sh`).  
(Values supplied to the installer script generate overrides in the `config.sh` file.)  
(Any parameters listed in the example are optional.)  
  
- Using defaults:  
`bash ./install.sh` 


USAGE:  
  
- With env vars:  
`export  SKIT_ALERT_EMAIL='d.phens@gmail.com' DO_TEST=1; ./status.sh`  
(`DO_TEST=1` makes the status script parse a different URL, triggering it to send a status e-mail even if DigitalOcean is all fine.)  
(Env vars are optional)  
  
- With cmdline params:  
`./status.sh SKIT_ALERT_EMAIL='recvmsgs@gmail.com' MAIL_FROM='skit.alerts@gmail.com' MAIL_PASS='nepoviemHesl0' SMTP_ADDR='smtp.gmail.com' SMTP_PORT='587'`  
(`DO_TEST=1` works as above.)  
(Cmdline params optional.)  
  
  
PRIORITY:  
  
COMMANDLINE-PARAMETERS override ENVIRONMENT-VARIABLES which override CONFIG-FILE.  


