class Sign < ApplicationRecord
  validates :username, presence: true,
                       uniqueness: {case_sensitive: false},
                       length:  {minimum:3, maximum:25}

    validates :mail, presence: true,
                    uniqueness: {case_sensitive: false},
                    length:  { maximum:25}

end
