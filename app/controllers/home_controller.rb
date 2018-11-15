class HomeController < ApplicationController

  after_action :subscribe_user_to_mailchimp, only:[:create]

  def new
    @user = Target.new
  end

  def student
  end

  def mairie
  end

  def video
  end 

  def create
    @user = Target.new(email: params["email"])
    if @user.save
      redirect_to request.referrer, notice: "Votre email a bien été ajoutée à la liste d'envoi de la newsletter !"
    else
    end
  end

  private

  def subscribe_user_to_mailchimp
    SubscribeUserToMailchimpJob.perform_now(@user)
  end



end
