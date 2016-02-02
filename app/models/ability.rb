class Ability
  include CanCan::Ability

  def initialize(user)
    if user.employee?
        can :manage,  :all
    else
        can :read, Profile, user: {id: user.id}
        can :bank_statement, User, id: user.id
    end

  end
  
end
