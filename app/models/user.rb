class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :rememberable, :lockable, :timeoutable,:validatable, password_length: 6..50,
  :authentication_keys => [:name]#nameでログイン

  # Emailを使用しない
  def email_required?
    false
  end
  def email_changed?
    false
  end
  def will_save_change_to_email?
    false
  end
end
