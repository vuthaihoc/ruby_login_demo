class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :level
      t.string :identification

      t.timestamps
    end

    Group.create( id: 1, name: 'Administrator', level: 0,  identification: :admin)
    Group.create( id: 2, name: 'Moderator', level: 1,  identification: :admod)
    Group.create( id: 3, name: 'Speaker', level: 2,  identification: :special)
    Group.create( id: 4, name: 'Advertiser', level: 3,  identification: :adv)
    Group.create( id: 5, name: 'Farmer', level: 4,  identification: :farmer)
    Group.create( id: 6, name: 'Register', level: -1,  identification: :register)

  end
end
