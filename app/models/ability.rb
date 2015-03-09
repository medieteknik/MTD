class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :super_admin
      can :manage, :all
      can :access_panel, User
    elsif user.role? :admin
      can :manage, :all
      can :access_panel, User
      cannot [:read, :update, :create, :destroy], Role
    elsif user.role? :company_representative
      can [:update, :destroy], News do |n|
        n.try(:users).include? user
      end
      can [:create, :read], News
    else
      can :update, User do |u|
        u.try(:user) == user
      end
      can :read, [News, Company, Lecture]
      can [:create, :read], [Suggestion, Host, Studentexpo]
    end
  end
end
