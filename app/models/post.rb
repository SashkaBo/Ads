class Post < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :type

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  state_machine :status, :initial => :draft do

    event :to_new do
      transition :draft => :new
    end

    event :reject do
      transition :new => :reject
    end

    event :approve do
      transition :new => :approve
    end

    event :to_draft do
      transition :reject => :daft
    end

    event :publish do
      transition :approve => :publish
    end

  end

  def get_possible_statuses
    possible_statuses = []
    if user.role.user?
      case status
        when 'draft'
          possible_statuses = [:new]
        when 'reject'
          possible_statuses = [:draft]
      end
    elsif user.role.admin?
      possible_statuses = [:approve, :reject] if staus == 'new'
    end
    possible_statuses
  end

end
