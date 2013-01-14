class User < ActiveRecord::Base
  has_many :usersecrets
  has_many :useraddrs
  has_many :userinfos
  # attr_accessible :title, :body
end
