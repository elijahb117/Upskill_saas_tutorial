class Users::RegistrationsController < Devise::RegistrationsController
    before_action :select_plan, only: :new
  
  # Extedn default Devise gem behavior so that
  # users signing up with the Pro accoutnt (Plan id 2)
  # save with a special Stripe subsription function.
  # Otherwise Devise singns up user as usual
  def create
    super do |resource|
      if params[:Plan]
        resource.plan_id = params[:Plan]
        if resource.Plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
  
private
  def select_plan
    unless (params[:Plan] == '1' || params[:Plan] == '2')
      flash[:notice] = "Please select a membership plan to sign up."
      redirect_to root_url
    end
  end
end