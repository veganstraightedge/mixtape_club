class Entry < ApplicationRecord
  delegated_type :entryable, types: %w[Image Audio], dependent: :destroy

  belongs_to :user,    inverse_of: :entries
  belongs_to :mixtape, inverse_of: :entries
end
