require 'spec_helper'
require 'authentication'

describe 'Authenticate' do

    describe '.endPoint' do
        context 'serves up the correct end-point' do
            it 'returns string' do
                expect(Authenticate.endPoint).to eql("https://coolpay.herokuapp.com/api/login")
            end
        end
    end

    describe '.postRequest' do
        context 'POSTs name and API key' do
            it 'returns a token' do
                testingEndPoint = 'https://private-anon-b5d4efcaba-coolpayapi.apiary-mock.com/api/login'
                
                allow(Authenticate).to receive(:endPoint).and_return(testingEndPoint)
                
                privateMethodCall = Authenticate.send(:postRequest)

                hash = JSON.parse(privateMethodCall.body)
                token = hash.fetch("token")

                expect(token).to eql("aff06fec-e041-4994-849e-223f0569e0bc")
            end
        end 
    end 

    describe '.freshToken' do
        context 'takes HTTP response from postRequest' do
            it 'extracts token' do
                dummyData = "{\"token\":\"efbee74f-f9f7-419a-b1d6-e259c1b94674\"}"
                allow(Authenticate).to receive(:postRequest).and_return(dummyData)

                expect(Authenticate.freshToken).to eql("efbee74f-f9f7-419a-b1d6-e259c1b94674")
            end
        end
    end
    
end