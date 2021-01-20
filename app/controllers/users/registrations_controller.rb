class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if params[:Plan]
        resource.Plan_id = params[:Plan]
        if resource.Plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end