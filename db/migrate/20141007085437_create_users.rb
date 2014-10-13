class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: true
      t.string :username
	  t.string :password
	  t.string :active_status
	  t.string :active_key
	  t.datetime :active_key_sent
	  t.string :remember_token, index: true

      t.timestamps
    end

    say "adding demo user"

    if User.create(id: 1, name: 'Administrator', username: :admin, email: 'admin@test.com', password: '12345', active_status: 'activeted')
    	say "insert demo admin ok"
    else
    	say "insert demo admin not ok"
    end
  end
end
