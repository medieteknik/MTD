class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :admin
      can :manage, :all
      cannot [:read, :update, :create, :destroy], Role
    else
      can :update, User do |u|
        u.try(:user) == user
      end
    end
  end
end
