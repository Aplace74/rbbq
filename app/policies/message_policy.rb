class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where("sender_id = #{user.id}")
      .or(Message.where("receiver_id = #{user.id}"))
      .order(created_at: :desc)
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def read?
    record.receiver == user
  end

  def destroy?
    record.receiver == user || record.sender == user
  end
end
