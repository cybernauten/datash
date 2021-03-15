class AddUserNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string, default: "email"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
