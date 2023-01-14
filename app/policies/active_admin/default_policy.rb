# frozen_string_literal: true
class ActiveAdmin::DefaultPolicy < ApplicationPolicy
  attr_reader :user, :record

  def destroy_all?
    true
  end
end