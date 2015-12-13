class Article < ActiveRecord::Base
  validates :title, :body, presence: {message: "must not be blank."}

  default_scope {order(created_at: :desc)}

end
