class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_create :default_user_role_standard
  has_many :teams

  def admin?
    role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  private

  def default_user_role_standard
    self.role ||= 'standard'
  end
end
