module PostRepository
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where state: :active }
    scope :success, -> { where story_state: :success }
    scope :published, -> { where publication_state: :published }
    scope :processed, -> { where story_state: :processed }
  end
end
