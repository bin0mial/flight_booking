class ActiveAdmin::UserPolicy < ActiveAdmin::DefaultPolicy
  def index?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
