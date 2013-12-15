class Post < ActiveRecord::Base
  include PostRepository

  belongs_to :user

  validates :description, presence: true
  validates :place, presence: true
  validates :date, presence: true

  mount_uploader :photo, PostPhotoUploader

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

  state_machine :story, initial: :processed do
    state :processed
    state :success

    event :to_success do
      transition processed: :success
    end

    event :error_success do
      transition success: :processed
    end
  end

  state_machine :publication_state, initial: :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition unpublished: :published
    end
  end
end
