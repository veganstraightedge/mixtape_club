class User < ApplicationRecord
  PASSWORD_MINIMUM_LENGTH = 30

  devise :confirmable, :database_authenticatable,
         :lockable, :recoverable, :registerable,
         :rememberable, :timeoutable, :validatable

  has_one_attached :avatar
  has_many :mixtapes, dependent: :destroy, inverse_of: :user

  validates :password,
            presence:  true,
            on:        :create,
            length:    { minimum: PASSWORD_MINIMUM_LENGTH },
            exclusion: {
              in:      [
                'mickey fickey fire cracker soap on a rope',
                'a long passphrase to meet the minimum length'
              ],
              message: 'The passphrase ‘%<value>{value}’ is prohibited.'
            }

  validates :bio,      length: { maximum: 300 }
  validates :email,    uniqueness: true, 'valid_email_2/email': true
  validates :username, uniqueness: true, presence: true, length: { in: 2..40 }

  def handle
    "@#{username}"
  end

  def path
    "/@#{username}"
  end
end
