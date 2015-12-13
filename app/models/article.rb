class Article < ActiveRecord::Base
  validates :title, :body, presence: {message: "must not be blank."}

end
