require 'faraday'

class RegistrationsController < Devise::RegistrationsController


  def create
    @user = User.new(sign_up_params)
    if valid_email(@user.email)
      if @user.save
        redirect_to login_path
      else
        redirect_to new_user_registration_path, notice: "User not saved"
      end
    else
      redirect_to new_user_registration_path, notice: "Enter valid email"
    end
  end

    private
  
    def sign_up_params
      params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation)
    end

    def valid_email(email)
      url = "https://emailverification.whoisxmlapi.com/api/v3?apiKey=at_tljLiAGBD4hwf2NVEE9feBIFwvmRC&emailAddress=#{email}"
      connection = Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
      response = connection.get
      if response.success?
        json_response = JSON.parse(response.body)
        return json_response['formatCheck'] == "true" && json_response['disposableCheck'] == "false" && json_response['smtpCheck'] == "true"
      else
        return false
      end
    end
  
    def account_update_params
      params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation, 
                                    :current_password)
    end
  end