class TeamPolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end
end