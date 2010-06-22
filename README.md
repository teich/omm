Mail Merger
-----------

I find I need to mail a set of people about service usage fairly often (hey, this thing you're using is going out of beta, etc).  Tired of using cc/bcc (and always doing the wrong thing) and wanting some merge fields, I whipped up this stupid app to mail people.

Take a tab seperated list of people and fields you want to merge + an ERB template

Recipient list format is:
    
    emailaddress	field1	field2	field3	...

It parses on tabs, and creates an array of @fields[] of all the fields you've got.

Template is ERB format

Google Apps auth
===============

We use google apps as our main SSO.  My weak skills meant I couldn't get my usual "http://github.com/tobi/google_apps_login":(Tobi's Google App Login) working, so I went with "http://github.com/atmos/warden-googleapps":(Warden Google Apps) instead.  Warden works amazingly well.  I couldn't figure out how to pass a valid faliure app, so I did nasty hacky things. 
