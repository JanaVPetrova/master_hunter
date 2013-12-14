module PostRepository
  extend ActiveSupport::Concern

  included do
    scope :web, -> { where state: :active }
  end
end