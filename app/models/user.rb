class User < ApplicationRecord
  PASSWORD_MINIMUM_LENGTH = 30
  BIO_MAXIMUM_LENGTH      = 300

  devise :confirmable, :database_authenticatable,
         :lockable, :recoverable, :registerable,
         :rememberable, :timeoutable, :validatable

  has_one_attached :avatar
  has_many :mixtapes, dependent: :destroy, inverse_of: :user
  has_many :entries,  dependent: :destroy, inverse_of: :user

  validates :password,
            presence:  true,
            on:        :create,
            length:    { minimum: PASSWORD_MINIMUM_LENGTH },
            exclusion: {
              in:      ['mickey fickey fire cracker soap on a rope', 'a long passphrase to meet the minimum length'],
              message: 'The passphrase ‘%<value>{value}’ is prohibited.'
            }

  validates :bio,      length: { maximum: BIO_MAXIMUM_LENGTH }
  validates :email,    uniqueness: true, 'valid_email_2/email': true
  validates :username, uniqueness: true, presence: true, length: { in: 2..40 }

  normalizes :bio,      with: -> bio      { bio.strip.truncate BIO_MAXIMUM_LENGTH, separator: ' ', omission: '' }
  normalizes :username, with: -> username { username.parameterize.remove(/-|_/) }

  def handle = "@#{username}"
  def path = "/@#{username}"
end
