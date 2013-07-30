class CreateHypotheticals < ActiveRecord::Migration
  def change
    create_table :hypotheticals do |t|
      t.string :hypo1
      t.string :hypo2

      t.timestamps
    end
  end
end
