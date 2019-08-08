class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def home?
    true
  end

  def dashboard?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user
  end
end
