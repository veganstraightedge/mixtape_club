class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.text :url
      t.text :description
      t.boolean :embed, null: false, default: false
      t.string :template

      t.timestamps
    end
  end
end
