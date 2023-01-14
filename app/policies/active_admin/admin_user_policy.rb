class ActiveAdmin::AdminUserPolicy < ActiveAdmin::DefaultPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.id == user.id
  end
end
