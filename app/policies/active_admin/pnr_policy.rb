class ActiveAdmin::PnrPolicy < ActiveAdmin::DefaultPolicy
  def index?
    true
  end

  def show?
    true
  end
end
