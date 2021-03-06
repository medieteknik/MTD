class Ability
  include CanCan::Ability

  def initialize(user, company = Company.new, request_identifier = nil)
    user ||= User.new # guest user (not logged in)

    if user.role? :super_admin
      can :manage, :all
      can :access_panel, User
    elsif user.role? :admin
      can :manage, :all
      can :access_panel, User
      cannot [:read, :update, :create, :destroy], Role
    elsif user.role? :photographer
      can :create, Image
      can [:update, :destroy], Image do |i|
        i.try(:user) == user
      end
      can :access_panel, User
      can :read, :all
    elsif user.role? :company_representative
      can [:update, :destroy], News do |n|
        n.try(:users).include? user
      end
      can [:create, :read], News
    else
      can :update, User do |u|
        u.try(:user) == user
      end
      can :update, Company if company && company.identifier && company.identifier == request_identifier
      can :read, [News, Company, Lecture, Booth, PhotoAlbum]
      can [:create, :read], [Suggestion, Host, Studentexpo]
    end
  end
end
