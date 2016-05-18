class SessionsController < Devise::SessionsController

  def create

    self.resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)
    render :js => "window.location = '/tasks'"
  end

  def failure

    warden.custom_failure!
    render json: { success: false, errors: ["Login Failed"] }, status: 401
  end

end