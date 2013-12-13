module PostsHelper
  include AutoHtml

  def map(place)
    auto_html place do
      google_map link_text: I18n.t(".view_map")
    end
  end
end
