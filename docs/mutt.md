CLI e-mail client

# Usage

<http://www.mutt.org/doc/manual/manual-2.html>

```
j or Down       next-entry      move to the next entry
k or Up         previous-entry  move to the previous entry
z or PageDn     page-down       go to the next page
Z or PageUp     page-up         go to the previous page
= or Home       first-entry     jump to the first entry
* or End        last-entry      jump to the last entry
q               quit            exit the current menu
?               help            list all keybindings for the current menu
```

# Message Deletion

<http://www.sendmail.org/~ca/email/mutt/manual-4.html>

- Delete e-mails older than 2012-12-01: `[shift-d] ~d 1/12/12-1/1/1 # D/M/Y. this will only delete back to 2001-01-01`
- Delete messages where the subject matches a search: `[shift-d] ~b search\ pattern`
- Delete messages where the subject matches a search: `[shift-d] ~s search\ pattern`
- Delete messages older than one month: `[shift-d] ~d <1m`
- : ''essentially this is: delete where (message date +%s) < (date -d '-1 month' +%s)''
