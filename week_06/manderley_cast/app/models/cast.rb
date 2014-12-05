class Cast < ActiveRecord::Base
  belongs_to :person
  belongs_to :movie

  ROLES = ["actor", "coffee", "director"]
end
