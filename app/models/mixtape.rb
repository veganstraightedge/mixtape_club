class Mixtape < ApplicationRecord
  VISIBILITIES = { draft: :draft, secret: :secret, published: :published, archived: :archived }.freeze

  belongs_to :user, inverse_of: :mixtapes

  normalizes :title,       with: -> title       { title.squish }
  normalizes :subtitle,    with: -> subtitle    { subtitle.squish }
  normalizes :description, with: -> description { description.strip }

  before_validation :sluggify

  class << self
    def visibilities = VISIBILITIES
  end

  def sluggify
    self.slug = title.to_slug
  end

  # # # # # # TODO: Fix the enum below and delete temp workaround scopes/methods
  #
  #
  # TODO: This isn't saving! Am *I* doing something wrong? Is there a Rails bug? TBD later
  # enum :visibility,
  #      { draft: :draft, secret: :secret, published: :published, archived: :archived },
  #      validate: true,
  #      default:  :draft

  # TEMP: enum scopes until enum above is working
  scope :draft,     -> { where visibility: :draft }
  scope :secret,    -> { where visibility: :secret }
  scope :published, -> { where visibility: :published }
  scope :archived,  -> { where visibility: :archived }

  # TEMP: enum methods until enum above is working
  def draft?     = visibility == 'draft'
  def secret?    = visibility == 'secret'
  def published? = visibility == 'published'
  def archived?  = visibility == 'archived'
end
