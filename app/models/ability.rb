class Ability
  include CanCan::Ability

  def initialize(admin)
    admin ||= Admin.new # guest user (not logged in)

    if admin.role? :super_admin
      can :manage, :all
    else
  end
end
