require 'rest_client'
require 'json'

class Recipients
    
    def self.getRecipients
        headers = {
        :content_type => 'application/json',
        :authorization => 'Bearer ' + Authenticate.freshToken
        }
        
        response = RestClient.get Recipients.endPoint, headers
    end

    def self.listRecipients(arguments = nil)
        hashOfJsonData = (JSON.parse(Recipients.getRecipients))
        recipientsIndex = hashOfJsonData.fetch("recipients")

        if arguments == nil
            recipientsIndex.each_with_index { |value, index| puts value.fetch("name")}
            puts "\n\n\n"
        end

        return recipientsIndex
    end

    def self.selectRecipient
        recipientsIndex = Recipients.listRecipients(1)
        recipientsIndex.each_with_index { |value, index| 
            puts "#{index.to_i + 1} - #{value.fetch("name")}" 
        }
        puts "Enter recipient number and press enter to make a transfer"
        selection = gets.chomp.to_i
        selection -= 1
        recipientHash = recipientsIndex[selection]

        Payments.makePayment(recipientHash.fetch("id"))
    end

    def self.inputNewRecipient
        puts "Enter new recipient name: "
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

