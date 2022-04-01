module ApplicationHelper
  def gravatar_for(sign)
      email_address = sign.mail.downcase
      hash=Digest::MD5.hexdigest(email_address)
      gravatar_url="https://www.gravatar.com/avatar/#{hash}?s=100"
       image_tag(gravatar_url, alt: sign.username)

  end
end
