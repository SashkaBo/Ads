class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save   :default_values

  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :sex, in: [:male, :female, :none], default: :none
  #, default: lambda { |user| SexIdentifier.sex_for_name(user.name).to_sym }
  enumerize :role, in: [:user, :admin], default: :user

  def default_values
    self.name ||= 'noname'
  end

end
