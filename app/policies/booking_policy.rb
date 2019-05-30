class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    false
  end

  def destroy?
    record.user == user || record.barbecue.user == user
  end

  def accept?
    record.barbecue.user == user
  end
  
end
