module ApplicationHelper
  def gravatar_for(sign)
      email_address = sign.mail.downcase
      hash=Digest::MD5.hexdigest(email_address)
      gravatar_url="https://www.gravatar.com/avatar/#{hash}?s=100"
       image_tag(gravatar_url, alt: sign.username)

  end

  def current_sign
    @current_sign ||= Sign.find(session[:sign_id]) if session[:sign_id]



  end
  def logged_in?
    !!current_sign

  end
end
