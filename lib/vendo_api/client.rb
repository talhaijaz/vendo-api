module VendoApi
    class Client
        def perform_request
            url = "https://demo.getvendo.com/spree_oauth/token"
            response = HTTParty.post(url,
                                    basic_auth: {user_name: 'talhaijaz123451@gmail.com', password: 'vendo123', grant_type: 'password'},
                                    headers: { 'Accept' => "application/json", 'Content-Type' => 'application/json' })
            JSON.parse(response.body)
        end
    end
end