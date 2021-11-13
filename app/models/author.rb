class Author < ApplicationRecord
    def name
        first_name.dup << " " << last_name
    end
end
