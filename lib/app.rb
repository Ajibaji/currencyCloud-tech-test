require 'rest_client'

    # makes a POST request to coolpay RESTful endpoint and returns a json file with requested security token in it 
    def authenticate
        
        # creates a json file with coolpay requested values
        values = '{
            "username": "AmmarA",
            "apikey": "0581938E7737A65B"
            }'
        
        # creates a header 
        headers = {
            :content_type => 'application/json'
            }
        
        # puts the URI, the values and headers in one single object
        response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, headers
        
        # calls the object
        response # works the same as "return response"
    end

    # turns the json file into a hash so ruby can read it better
    def freshToken
        tokenHash = JSON.parse(authenticate) #turns the json file received into a more readable Ruby style hash
        tokenHash.fetch("token") # finds the key "token" and retrives it's value-pair. Also, since this is the last command in the method, its value is what gets returned
    end 


