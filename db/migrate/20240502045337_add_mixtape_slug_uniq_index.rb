class AddMixtapeSlugUniqIndex < ActiveRecord::Migration[7.1]
  def change
    remove_index :mixtapes, :slug
    add_index :mixtapes, :slug, unique: true
  end
end
