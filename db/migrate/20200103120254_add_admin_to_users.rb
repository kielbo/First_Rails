class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default:false
    #dodaj do tabeli users kolumne admin z domyslna wartoscia false
  end
end
