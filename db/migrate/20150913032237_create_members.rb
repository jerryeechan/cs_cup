class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :person_id
      t.string :birthday
      t.string :school_id
      t.string :cellphone
      t.string :etc

      t.timestamps null: false
    end
  end
end
