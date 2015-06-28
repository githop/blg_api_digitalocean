class User < ActiveRecord::Base
	has_many :articles
	has_secure_password

	enum role: [:basic, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :basic
  end
end
