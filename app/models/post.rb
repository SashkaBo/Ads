class Post < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :type

  LIFE_CIRCLE = %w[draft new rejected approved posted]

  enumerize :life_circle, in: LIFE_CIRCLE, default: :draft

end
