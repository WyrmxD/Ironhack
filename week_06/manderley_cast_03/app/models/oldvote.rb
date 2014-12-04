class Oldvote < ActiveRecord::Base
  belongs_to :person
  belongs_to :user

  scope :user, ->(user) {where user: user}
  scope :person, ->(person) {where person: person}

  scope :oldthy, ->() {where points: 1}
  scope :youngthy, ->() {where points: -1}

end
