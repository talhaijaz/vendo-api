module VendoApi
    class Client
        attr_accessor :url

        def initialize
            self.url = 'https://demo.getvendo.com/spree_oauth/token'
            @headers = { 'Accept' => "application/json", 'Content-Type' => 'application/json' }
        end

        def authenticate_api(email, password)
            response = HTTParty.post(url,
                                    body: { grant_type: 'password', username: email, password: password }.to_json,
                                    headers: @headers )
            JSON.parse(response.body)
        end

        def refresh_api_token(token)
            response = HTTParty.post(url,
                                    body: { grant_type: 'refresh_token', refresh_token: token  }.to_json,
                                    headers: @headers )
        end
    end
end 