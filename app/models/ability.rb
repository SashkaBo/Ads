class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
     user ||= User.new # guest user (not logged in)
     if user.role == "admin"
       can :manage, :all
       cannot [:change_roles, :delete], User, id: user.id
       can :delete, Type, posts: []
       cannot [:create, :update], Post
       cannot :read, Post, status: "draft"
     elsif user.role == "user" && user.persisted?
       can :change_status, Post, user_id: user.id
       can :manage, User, id: user.id
       cannot :change_roles, User
       can :read, User
       can :read, Post, status: "publish"
       can :manage, Post, user_id: user.id
       cannot :update, Post do |post|
         post.status != "draft"
       end
     else
       can :read, Post do |post|
         post.status == "publish"
       end
     end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

end
