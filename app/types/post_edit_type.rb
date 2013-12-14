class PostEditType < Post
  include ApplicationType

  permit :nickname, :description, :place, :date, :photo
end