class CreateHypotheticals < ActiveRecord::Migration
  def change
    create_table :hypotheticals do |t|
      t.string :hypo1
      t.string :hypo2
      t.integer :hypo1_votes
      t.integer :hypo2_votes

      t.timestamps
    end
  end
end
