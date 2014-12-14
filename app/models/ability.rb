class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :super_admin
      can :manage, :all
    else
      # nothing
    end
  end
end
