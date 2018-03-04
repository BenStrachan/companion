class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      else
        can [:edit, :update, :destroy], Advertisement do |ad|
          ad.user_id == user.id
        end
      end
    end
  end
end
