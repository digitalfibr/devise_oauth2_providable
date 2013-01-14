class Devise::Oauth2Providable::TokensController < ApplicationController
  #before_filter :clear_session
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :create

  def create
    @refresh_token = oauth2_current_refresh_token
    unless @refresh_token
      @refresh_token = Devise::Oauth2Providable.ABSTRACT(:refresh_token).create!(
        :user => current_user,
        Devise::Oauth2Providable.ABSTRACT(:client_sym) => oauth2_current_client
      )
    end
    @access_token = Devise::Oauth2Providable.ABSTRACT(:access_token).create!(
      :user => current_user,
      Devise::Oauth2Providable.ABSTRACT(:client_sym) => oauth2_current_client,
      Devise::Oauth2Providable.ABSTRACT(:refresh_token_sym) => @refresh_token
    )
    render :json => @access_token.token_response
  end
  private
  def oauth2_current_client
   env[Devise::Oauth2Providable::CLIENT_ENV_REF] ||= get_client
  end
  def oauth2_current_refresh_token
    env[Devise::Oauth2Providable::REFRESH_TOKEN_ENV_REF] ||= get_refresh_token
  end
  
  def get_client
    if params[:client_id] && params[:client_secret]
      client_id, client_secret = request.authorization ? decode_credentials : [params[:client_id], params[:client_secret]]
      client = Devise::Oauth2Providable.ABSTRACT(:client).find_by_app_identifier client_id
      client if client && client.secret == client_secret
    end
  end
  
  def get_refresh_token
    if params[:refresh_token]
      model = Devise::Oauth2Providable.ABSTRACT(:refresh_token)
      model.not_expired.of_client(oauth2_current_client.id).find_by_token(params[:refresh_token])
    end
  end
  # def clear_session
  #   session.clear
  # end
end
