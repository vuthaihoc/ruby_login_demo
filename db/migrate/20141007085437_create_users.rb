class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :name
    t.string :email, index: true
    t.string :username
    t.integer :group_id, default: 6
	  t.string :password
	  t.string :active_status, default: 'registed'
	  t.string :active_key
	  t.datetime :active_key_sent
	  t.string :remember_token, index: true

      t.timestamps
    end

    say "adding demo user"

    User.create(id: 1, name: 'Administrator', username: :admin, email: 'admin@test.com', group_id: 1, password: '12345', active_status: 'activeted',password_confirmation: '12345')
    User.create(id: 2, name: 'Register', username: :user, email: 'register@test.com', group_id: 6, password: '12345', active_status: 'register',password_confirmation: '12345')

  end
end
