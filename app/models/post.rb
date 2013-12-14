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

  state_machine :story, initial: :process do
    state :process
    state :success

    event :to_success do
      transition process: :success
    end

    event :error_success do
      transition success: :process
    end
  end
end
