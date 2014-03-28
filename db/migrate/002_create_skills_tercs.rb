class CreateSkillsTercs < ActiveRecord::Migration
  def self.up
    create_table :skills_tercs do |t|
      t.string :name
    end
  end
   def self.down
	drop_table:skills_tercs
   end
end
