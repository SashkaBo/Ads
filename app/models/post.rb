class Post < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :type

  STATUS = %w[draft new rejected approved posted]

  enumerize :status, in: STATUS, default: :draft

end
