require 'app'

describe '#authenticate' do
    context 'POSTs name and API key' do
        it 'returns 200 HTTP status code' do
            expect(authenticate.code).to eql(200)
        end
    end 
end 

describe '#freshToken' do
    context 'takes HTTP response from authenticate' do
        it 'extracts token' do
            dummyData = "{\"token\":\"efbee74f-f9f7-419a-b1d6-e259c1b94674\"}"
            token = freshToken(dummyData)
            expect(token).not_to be_empty
        end
    end
end