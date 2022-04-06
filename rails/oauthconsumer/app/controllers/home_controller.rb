class HomeController < ApplicationController
  def index
    
    @oauth_client = OAuth2::Client.new(Rails.configuration.x.oauth.client_id,
                                       Rails.configuration.x.oauth.client_secret,                           
                                       site: Rails.configuration.x.oauth.site_url)

     url = @oauth_client.auth_code.authorize_url(redirect_uri: Rails.configuration.x.oauth.redirect_uri)
     @redirect_url = url+"&scope=user"  
     
     
                                
                                     

  end

  def oauth_callback
    debugger
    @oauth_client = OAuth2::Client.new(Rails.configuration.x.oauth.client_id,
    Rails.configuration.x.oauth.client_secret,                           
    site: Rails.configuration.x.oauth.site_url)
    response = @oauth_client.auth_code.get_token(params[:code], redirect_uri: Rails.configuration.x.oauth.redirect_uri)
    token = response.to_hash[:access_token]
  end
end
