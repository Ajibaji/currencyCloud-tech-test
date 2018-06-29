require 'app'

describe '#authenticate' do
    context 'POSTs name and API key' do
        it 'returns 200 HTTP status code' do
            response = authenticate
            expect(response.net_http_res.code).to eql("200")
        end
    end 
end 
describe '#freshToken' do
    context 'takes HTTP response from authenticate' do
        it 'extracts token' do
            freshToken.empty?
        end
    end
end

