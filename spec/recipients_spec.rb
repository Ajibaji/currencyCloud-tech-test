require 'spec_helper'
require 'recipients'

describe 'Recipients' do

    describe '.endPoint' do
        context 'serves up the correct end-point' do
            it 'returns string' do
                expect(Recipients.endPoint).to eql("https://coolpay.herokuapp.com/api/recipients")
            end
        end
    end

    describe '.getRecipients' do
        context 'makes a GET request with token in Header' do
            it 'returns a predetermined name' do
                dummyToken = "a941d184-43d2-4e71-969c-1e945be58e22"
                testingEndPoint = 'https://private-anon-b5d4efcaba-coolpayapi.apiary-mock.com/api/recipients'
                
                allow(Authenticate).to receive(:freshToken).and_return(dummyToken)
                allow(Recipients).to receive(:endPoint).and_return(testingEndPoint)

                hash = JSON.parse(Recipients.getRecipients.body)
                name = hash.fetch("recipients")[0].fetch("name")
        
                expect(name).to eql("Jake McFriend")
            end
        end
    end

    describe '.listRecipients' do
        context 'iterates through data from .getRecipients' do 
            it 'displays in menu format' do 
                dummyJsonData = '{
                    "recipients": [
                            {
                                "id": "6e7b4cea-5957-11e6-8b77-86f30ca893d3",
                                "name": "Jake McFriend"
                            }
                    ]
                }'
                allow(Recipients).to receive(:getRecipients).and_return(dummyJsonData)
                
                expect(Recipients.listRecipients[0].fetch("name")).to eql("Jake McFriend")
            end
        end
    end

    describe '.inputNewRecipient' do
        context 'take input from user' do 
            it 'should forward new Recipient name on to .submitNewRecipient' do 
                allow(Object).to receive(:gets).and_return("Gordon Gekko")
                allow(Recipients).to receive(:submitNewRecipient).with("Gordon Gekko").and_return("good")

                expect(Recipients.inputNewRecipient).to eql("good")
            end
        end 
    end
    
    describe '.submitNewRecipient' do
        context 'take input from .inputNewRecipient' do 
            it 'should submit to coolPay' do 
                testingEndPoint = 'https://private-anon-b5d4efcaba-coolpayapi.apiary-mock.com/api/recipients'
                dummyToken = "a941d184-43d2-4e71-969c-1e945be58e22"

                allow(Recipients).to receive(:endPoint).and_return(testingEndPoint)
                allow(Authenticate).to receive(:freshToken).and_return(dummyToken)

                methodCall = Recipients.submitNewRecipient("Gordon Gekko")
                expect(methodCall.code).to eql(201)
            end
        end 
    end

    describe '.selectRecipient' do
        context 'user selection' do
            it 'pass selection to Payments.makePayment' do
                dummyHash = [
                    {"name"=>"Jake McFriend", "id"=>"5bdcc9cb-2b98-402e-8001-6924eecebce2"}, 
                    {"name"=>"Gordon Gekko", "id"=>"5b10c9ac-2955-409a-98a8-7a73ea25751a"}, 
                    {"name"=>"Naughty Sheikh", "id"=>"cdad7bbc-6b78-4602-abfd-ae6e0187cf24"}, 
                    {"name"=>"Mr Burlusconi", "id"=>"3edbfa73-1320-4dc8-82c9-594e1c07312c"}
                ]
                 
                allow(Object).to receive(:gets).and_return("1")
                allow(Recipients).to receive(:listRecipients).and_return(dummyHash)
                allow(Payments).to receive(:makePayment)
                
                Recipients.selectRecipient

                expect(Payments).to have_received(:makePayment).with("5bdcc9cb-2b98-402e-8001-6924eecebce2")

                # allow(Payments).to receive(:makePayment) do |*args|
                    # expect(args[0]).to eql("5bdcc9cb-2b98-402e-8001-6924eecebce2")
                # end

                # (Payments).should_receive(:makePayment).with("5bdcc9cb-2b98-402e-8001-6924eecebce2")
            end
        end
    end

end