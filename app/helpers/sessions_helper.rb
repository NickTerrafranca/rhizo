module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.signed[:user_id] = {value: user.id, expires: 30.days.from_now}
    cookies[:remember_token] = {value: user.remember_token, expires: 30.days.from_now}
  end

  def forget(user)
    user.forget if user
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out_user
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user && user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL for friendly forwarding
  def stash_url
    session[:forwarding_url] = request.original_url if request.get?
  end
end
