class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :manage, Group, user_id: user.id
    can :manage, Record, user_id: user.id
    can :manage, :all if user.role == 'admin'
  end
end
