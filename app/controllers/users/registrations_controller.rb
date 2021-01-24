class Users::RegistrationsController < Devise::RegistrationsController
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
end