class CreateMixtapes < ActiveRecord::Migration[7.1]
  def change
    create_table :mixtapes do |t|
      t.references :user,         null: false, foreign_key: true, index: true
      t.string     :title,        null: false
      t.string     :subtitle
      t.string     :slug, null: false, index: true
      t.text       :description
      t.string     :visibility, null: false, default: :draft
      t.datetime   :published_at

      t.timestamps
    end
  end
end
