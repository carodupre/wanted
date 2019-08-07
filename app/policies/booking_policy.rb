class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
# pundit so we can display bookings for professional who has created them + the ones who has booked them
  def show?
    user_is_owner_or_admin? || user_is_professional?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user
  end

  def user_is_professional?
    user == User.find(Service.find(record.service_id).user_id)
  end
end
