class AddVoteCounts < ActiveRecord::Migration
    def change
        change_table :hypotheticals do |t|
            t.integer :hypo1_votes, default: 0
            t.integer :hypo2_votes, default: 0
        end
    end
end
