module PostRepository
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where state: :active }
    scope :success, -> { where story: :success }
    scope :published, -> { where publication_state: :published }
  end
end