class Usersecret < ActiveRecord::Base
  belongs_to :user
  # attr_accessible :title, :body
end
