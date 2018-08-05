# app/controllers/concerns/authenticatable.rb 
module Authenticatable
  extend ActiveSupport::Concern

  # detrmine if the user can access the admin panel
  def access_permissions
    return true if authenticated? # && admin?
    flash[:error] = I18n.t('auth.invalid_permissions')
    redirect_to root_path
  end

  # return unauthorized status if not authenticated
  # def authenticate!
  #   true if authenticated?
  #   render(plain: 'Unauthorized!', status: :unauthorized) unless authenticated?
  # end

  # look to see if authenticated
  def authenticated?
    session['cas'] && session['cas']['user']
  end

  # return the current signed in user
  def current_user
    User.find_by(wvu_username: session[:cas][:user]) if authenticated?
  end

  # return true if admin
  def admin?
    return false if current_user.nil?
    current_user.admin?
  end

  # login methods
  def login
    if authenticated?
      flash[:success] = I18n.t('auth.success')
      redirect_to root_path
    else
      render(plain: 'Unauthorized!', status: :unauthorized)
    end
  end

  # logout
  def logout
    session.delete('cas')
    flash[:success] = I18n.t('auth.log_out')
    redirect_to root_path
  end
end
