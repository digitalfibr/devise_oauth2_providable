require 'spec_helper'

describe 'SignInRequest' do
  let(:client_app) { Factory(:client) }
  let(:user_email) { "test_sign_up@sush.io" }
  let(:user_password) { "mySECRETpass" }
  let(:user) { Factory(:user, :email => user_email, :password => user_password) }
  
  it 'assumes iphone workflow' do
    # 0 - We sign up
    params = {
      :email => user_email,
      :password => user_password
    }
    
    post '/users/', params
    
    response.status.to_i.should == 200

    # -------------------------------------------------------------------------
    # 1 - We sign in through grant password
    params = {
      :grant_type => 'password',
      :client_id => client_app.app_identifier,
      :client_secret => client_app.secret,
      :username => user.email,
      :password => user_password
    }

    post '/oauth2/token', params

    User.count.should == 1
    puts "response #{response.body}"
    response.code.to_i.should == 200

    RefreshRequest.count.should == 1
    GrantAccessToken.count.should == 1

    get '/protected', :format => 'json', :params => [:access_token => GrantAccessToken.first.token]

    response.code.to_i.should == 200

    # -------------------------------------------------------------------------
    # 2 - We refresh token
    
    refresh_token = RefreshRequest.first
    params = {
      :grant_type => 'refresh_token',
      :client_id => client_app.app_identifier,
      :client_secret => client_app.secret,
      :refresh_token => refresh_token.token
    }

    puts "params : #{params} => #{refresh_token.inspect}"

    post '/oauth2/token', params

    response.code.to_i.should == 200

    RefreshRequest.count.should == 1
    GrantAccessToken.count.should == 2

    refresh_token = RefreshRequest.last(:order => :created_at)
    access_token = GrantAccessToken.last(:order => :created_at)
    expected = {
      :token_type => 'bearer',
      :expires_in => 900,
      :refresh_token => refresh_token.token,
      :access_token => access_token.token
    }
    response.body.should match_json(expected)

    # -------------------------------------------------------------------------
    # 3 - We make both access token and refresh token expired

    expired_date = 2.days.ago
    [RefreshRequest, GrantAccessToken].each do |model|
      model.all.each do |r|
        r.expires_at = expired_date
        r.save
      end
    end

    # -------------------------------------------------------------------------
    # 4 - We make a request to refresh our token
    
    params = {
      :grant_type => 'refresh_token',
      :client_id => client_app.app_identifier,
      :client_secret => client_app.secret,
      :refresh_token => refresh_token.token
    }

    post '/oauth2/token', params

    response.code.to_i.should == 400
  end
end