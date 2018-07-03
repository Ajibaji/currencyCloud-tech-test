require 'rest_client'
require 'json'

class Payments

    # def initialize
        @@lastPaymentId = nil
    # end 

    def self.getPayments
        headers = {
            :content_type => 'application/json',
            :authorization => 'Bearer ' + Authenticate.freshToken
          }
          
          RestClient.get Payments.endPoint, headers
    end

    def self.listPayments
        hashOfJsonData = (JSON.parse(Payments.getPayments))
        paymentsIndex = hashOfJsonData.fetch("payments")

        paymentsIndex.each { |entry| 
            entry.each { |key, value|
                puts (key + ": " + value)
            }    
            puts "\n\n\n"
        }
    end

    def self.makePayment(recipientId)
        values = '{
          "payment": {
            "amount": ' + Payments.inputAmount + ',
            "currency": "GBP",
            "recipient_id": "' + recipientId + '"
            }
        }'

        headers = {
        :content_type => 'application/json',
        :authorization => 'Bearer ' + Authenticate.freshToken
        }

        response = RestClient.post Payments.endPoint, values, headers
        puts "\n\n\n"

        hashOfJsonData = JSON.parse(response)
        @@lastPaymentId = hashOfJsonData.fetch("payment").fetch("id")
    end

    def self.inputAmount
        puts "Enter amount"
        amount = gets.chomp
    end 

    def self.checkPaymentStatus
        
        if @@lastPaymentId != nil
            hashOfAllPayments = JSON.parse(Payments.getPayments)
            lastPayment = (hashOfAllPayments.fetch("payments")).select { |payment| 
                payment.fetch("id") ==  @@lastPaymentId
            }

            paymentStatus = lastPayment[0].fetch("status")
            puts "Payment status: #{paymentStatus}"
            puts "\n SHOULD HAVE GONE TO CURRENCYcLOUD.COM" if paymentStatus == "failed"
        elsif
            puts "You're gonna need to make a payment before you can check it's status"
        end
        puts "\n\n\n"
    end

    def self.endPoint
        'https://coolpay.herokuapp.com/api/payments'
    end


end
