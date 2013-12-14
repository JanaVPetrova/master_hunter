class Post < ActiveRecord::Base
  include PostRepository

  validates :description, presence: true
  validates :place, presence: true
  validates :date, presence: true

  state_machine :state, initial: :active do
    state :active
    state :deleted

    event :mark_as_deleted do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end
end
