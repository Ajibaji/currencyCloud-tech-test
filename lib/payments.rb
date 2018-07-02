require 'rest_client'
require 'json'

class Payments

    def self.getPayments
        headers = {
            :content_type => 'application/json',
            :authorization => 'Bearer ' + Authenticate.freshToken
          }
          
          RestClient.get Payments.endPoint, headers
    end

    def self.endPoint
        'https://coolpay.herokuapp.com/api/payments'
    end


end
