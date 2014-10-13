class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :level
      t.string :identification

      t.timestamps
    end

    Group.create( id: 1, name: 'Administrator', level: 0,  identification: :admin)

    create_join_table :user, :group do |t|
	  t.index :user_id
	  t.index :group_id
	end
  end
end
