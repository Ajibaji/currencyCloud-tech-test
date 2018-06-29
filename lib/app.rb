require 'rest_client'
require 'json'



def authenticate
    values = '{
        "username": "AmmarA",
        "apikey": "0581938E7737A65B"
        }'
    headers = {
        :content_type => 'application/json'
        }
    
    RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers  
end

def freshToken(data)
    tokenHash = JSON.parse(data) 
    tokenHash.fetch("token") 
end 