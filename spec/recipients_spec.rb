require 'spec_helper'
require 'recipients'

describe 'Recipients' do

    describe '.listRecipients' do
        context 'makes a GET request with token in Header' do
            it 'returns 200 HTTP status code' do
                dummyToken = "a941d184-43d2-4e71-969c-1e945be58e22"
                testingEndPoint = 'https://private-anon-b5d4efcaba-coolpayapi.apiary-mock.com/api/recipients'
                
                allow(Authenticate).to receive(:freshToken).and_return(dummyToken)
                allow(Recipients).to receive(:endPoint).and_return(testingEndPoint)

                hash = JSON.parse(Recipients.listRecipients.body)
                name = hash.fetch("recipients")[0].fetch("name")
        
                expect(name).to eql("Jake McFriend")
            end
        end
    end

    describe '.endPoint' do
        context 'serves up the correct end-point' do
            it 'returns string' do
                expect(Recipients.endPoint).to eql("https://coolpay.herokuapp.com/api/recipients")
            end
        end
    end

end