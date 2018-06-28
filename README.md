Scenario
========
 
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