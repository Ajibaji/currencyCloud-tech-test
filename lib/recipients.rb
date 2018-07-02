require 'rest_client'
require 'json'

class Recipients
    
    def self.getRecipients
        headers = {
        :content_type => 'application/json',
        :authorization => 'Bearer ' + Authenticate.freshToken
        }
        
        RestClient.get Recipients.endPoint, headers
    end

    def self.listRecipients
        hashOfJsonData = (JSON.parse(Recipients.getRecipients))
        recipientsIndex = hashOfJsonData.fetch("recipients")

        recipientsIndex.each_with_index { |value, index| puts "#{index.to_i + 1} - #{value.fetch("name")}" }
    end

    def self.inputNewRecipient
        name = gets.chomp
        Recipients.submitNewRecipient(name)
    end

    def self.submitNewRecipient(name)
        values = '{
            "recipient": {
                 "name": "' + name + '"
            }
        }'

        headers = {
            :content_type => 'application/json',
            :authorization => 'Bearer ' + Authenticate.freshToken
        }

        RestClient.post Recipients.endPoint, values, headers
    end

    def self.endPoint
        'https://coolpay.herokuapp.com/api/recipients'
    end
end

