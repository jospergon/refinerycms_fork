class CreateRefinerycmsAuthenticationSchema < ActiveRecord::Migration
  def change
    create_table "#{Refinery::Core.config.table_prefix}roles" do |t|
      t.string :title
    end

    create_table "#{Refinery::Core.config.table_prefix}user_plugins" do |t|
      t.integer :user_id
      t.string  :name
      t.integer :position
    end

    add_index "#{Refinery::Core.config.table_prefix}user_plugins", :name
    add_index "#{Refinery::Core.config.table_prefix}user_plugins", [:user_id, :name], :unique => true

    create_table "#{Refinery::Core.config.table_prefix}users" do |t|
      t.string    :username,            :null => false
      t.string    :email,               :null => false
      t.string    :encrypted_password,  :null => false
      t.integer   :role_id
      t.datetime  :current_sign_in_at
      t.datetime  :last_sign_in_at
      t.string    :current_sign_in_ip
      t.string    :last_sign_in_ip
      t.integer   :sign_in_count
      t.datetime  :remember_created_at
      t.string    :reset_password_token
      t.datetime  :reset_password_sent_at

      t.timestamps
    end

    add_index "#{Refinery::Core.config.table_prefix}users", :id
  end
end
