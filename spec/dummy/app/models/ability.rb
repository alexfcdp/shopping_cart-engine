class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.persisted?

    can %i[index show], ShoppingCart::Order, user_id: user.id
  end
end
