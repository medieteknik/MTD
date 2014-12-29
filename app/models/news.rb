class News < ActiveRecord::Base
  translates :title, :content
end
