class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string     :entryable_type, index: true
      t.integer    :entryable_id

      t.references :mixtape, null: false, foreign_key: true, index: true
      t.references :user,    null: false, foreign_key: true, index: true

      t.string  :title
      t.string  :subtitle
      t.integer :position
      t.text    :description

      t.string :attribution_creator_name
      t.text   :attribution_url
      t.string :attribution_via_name
      t.string :attribution_via_url

      t.timestamps
    end
  end
end
