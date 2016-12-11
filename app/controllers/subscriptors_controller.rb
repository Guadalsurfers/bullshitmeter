class SubscriptorsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @subscriptor = Subscriptor.new(subscriptor_params)
    if @subscriptor.save
      flash[:notice] = "Thanks for subscribing! We'll keep you up to date"
    else
      flash[:notice] = 'You´re already subscribed'
    end
    redirect_to root_path
  end

  private

  def subscriptor_params
    params.require(:subscriptor).permit(:email)
  end
end
