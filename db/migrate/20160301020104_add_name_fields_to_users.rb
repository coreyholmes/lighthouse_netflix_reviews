class AddNameFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end


rails g migration add_categories_to_movies category