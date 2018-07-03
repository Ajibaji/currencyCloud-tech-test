Fakebook/CoolPay integration
========

Stack
------
- Ruby
- Rspec

Gems
-------
 - JSON - parsing JSON files
 - Rest_client - for RESTful interaction. Small and light-weight but very functional too. Eliminated my need for Sinatra completely.

Scenario
--------
Coolpay is a new company that allows to easily send money to friends through their API.
 
You work for Fakebook, a successful social network. You’ve been tasked to integrate Coolpay inside Fakebook. A/B tests show that users prefer to receive money than pokes!
 
You can find Coolpay documentation here: http://docs.coolpayapi.apiary.io/
 
You will write a small app that uses Coolplay API in Ruby. The app should be able do the following:
 
- Authenticate to Coolpay API
- Add recipients
- Send them money
- Check whether a payment was successful

User stories
------------
- as a user, for security, I should be able to authenticate with coolPay 

- as a user, so i can select who to send money to, I should be able to add and save a recipient to the system
  - as a user, i should be able to see what recipients are currently saved
  - as a user, i shouldn't be able to add a dulpicate recipient

- as a user, I should be able to send money to a selected recipient

- as a user, for security, i should be able to check if a payment was successful

Installation
------------
Clone or download this repo and navigate to the local repo/folder. Run the following command on the Linux/Unix console:
    ```bundle install --path .bundle ```

In the root folder (of this app), create a folder called ```config``` and in there create a file called ```env.yml``` and enter your login name and API key in the following format:
```API_USERNAME: '<username>'```
```API_KEY: '<api_key>' ```

Execute
-------
After installation, to execute run:
    ```ruby app.rb ```



If I had time
-------------

I would have liked to:
 - do more error checking, especially on user input. 
 - drill deeper on testing
 - get a little more sleep (have a look a the time stamps on the commits)
 - Make the UI much better
