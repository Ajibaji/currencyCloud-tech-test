# require 'spec_helper'
require 'payments'

describe 'Payments' do

    describe '.endPoint' do
        context 'serves up the correct end-point' do
            it 'returns string' do
                expect(Payments.endPoint).to eql("https://coolpay.herokuapp.com/api/payments")
            end
        end
    end

    describe '.getPayments' do
        context 'makes a GET request with token in Header' do
            it 'returns a json file of previous payments' do
                dummyToken = "a941d184-43d2-4e71-969c-1e945be58e22"
                testingEndPoint = 'https://private-anon-b5d4efcaba-coolpayapi.apiary-mock.com/api/payments'
                
                allow(Authenticate).to receive(:freshToken).and_return(dummyToken)
                allow(Payments).to receive(:endPoint).and_return(testingEndPoint)

                hash = JSON.parse(Payments.getPayments)
                id = hash.fetch("payments")[0].fetch("id")
        
                expect(id).to eql("31db334f-9ac0-42cb-804b-09b2f899d4d2")
            end
        end
    end

end
