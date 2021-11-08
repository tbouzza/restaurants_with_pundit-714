class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  # Who can edit a restaurant ?
  # the owner of a restaurant
  def update?
    admin_or_owner?
  end

  # Who can destroy a restaurant ?
  # The owner

  def destroy?
    admin_or_owner?
  end

  private

  def admin_or_owner?
    owner? || admin?
  end

  def admin?
    user.admin
  end

  def owner?
    record.user == user
  end
end
