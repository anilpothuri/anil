class Sign < ApplicationRecord
before_save { self.mail = mail.downcase }

  validates :username, presence: true,
                       uniqueness: {case_sensitive: false},
                       length:  {minimum:3, maximum:25}

    validates :mail, presence: true,
                    uniqueness: {case_sensitive: false},
                    length:  { maximum:25}
   has_secure_password

end
