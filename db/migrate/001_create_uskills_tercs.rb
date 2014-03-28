class CreateUskillsTercs < ActiveRecord::Migration
  def self.up
    create_table :uskills_tercs do |t|
      t.integer :id_users
      t.integer :id_skills
    end
   end
   def self.down
	drop_table:uskills_tercs
   end

end
