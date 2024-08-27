class CreateAudios < ActiveRecord::Migration[7.1]
  def change
    create_table :audios do |t|
      t.text :url
      t.text :description
      t.boolean :embed, null: false, default: false
      t.string :template

      t.timestamps
    end
  end
end
