class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :super_admin
      can :manage, :all
    else
      can :update, User do |user|
        user.try(:user) == user
      end
    end
  end
end
