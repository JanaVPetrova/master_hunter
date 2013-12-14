class Post < ActiveRecord::Base
  include PostRepository

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

  state_machine :publication_state, initial: :unpublished do
    state :published
    state :unpublished

    event :publish do
      transition unpublished: :published
    end
  end
end
