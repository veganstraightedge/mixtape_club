class User < ApplicationRecord
  PASSWORD_MINIMUM_LENGTH = 30

  devise :confirmable, :database_authenticatable,
         :lockable, :recoverable, :registerable,
         :rememberable, :timeoutable, :validatable
end
