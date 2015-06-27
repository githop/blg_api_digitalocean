class User < ActiveRecord::Base
	belongs_to :article
	has_secure_password

	enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
