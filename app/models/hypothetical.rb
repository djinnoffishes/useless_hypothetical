class Hypothetical < ActiveRecord::Base

    validates_presence_of :hypo1, :hypo2

    def increment_hypo1!
        update_attribute(:hypo1_votes, hypo1_votes + 1)
    end

    def increment_hypo2!
        update_attribute(:hypo2_votes, hypo2_votes + 1)
    end

end
