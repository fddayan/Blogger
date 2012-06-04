class Ability
  include CanCan::Ability

  def initialize(current_user)
<<<<<<< HEAD

    current_user||=User.new

    if current_user.role == "admin"
        can :manage, :all
    end
    if current_user.role == "manger"
        can :manage, [:posts, :comments]
    end
    if current_user.role == "poster"
        can :create, [:posts, :comments]
        can :read, :user
=======
    current_user ||= User.new
    
    if current_user.role == "admin"
        can :manage, :all
    elsif current_user.role == "manger"
        can :manage, [:posts, :comments]
    elsif current_user.role == "poster"
        can :create, [:posts, :comments]
        can :read, :posts
    else
        can :read, :all
>>>>>>> c4cc5fe13fa15ac5479f8e98a30b0a391f5d4077
    end
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
