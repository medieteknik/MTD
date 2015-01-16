class Suggestion < ActiveRecord::Base
  validates :content, presence: true, length: {minimum: 5}

  # regexps are horrible to read. see examples of this pattern here: http://www.regexr.com/3a7ur
  # basically, it's an email or a liu-id
  validates :email, format: { with: /([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6})|([A-Za-z]{4,5}[0-9]{3})/ }, allow_blank: true
end
