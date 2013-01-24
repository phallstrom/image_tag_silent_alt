require 'rubygems'
require 'test/unit'

require 'action_controller'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

require 'image_tag_silent_alt'

class TestStylesheetsForAll < ActionView::TestCase
  tests ActionView::Helpers::AssetTagHelper
  tests ImageTagSilentAlt::ActionViewExtensions

  ImageLinkToTag = {
    %(image_tag("xml.png")) => %(<img alt="" src="/images/xml.png" />),
    %(image_tag("rss.png", :alt => "rss syndication")) => %(<img alt="rss syndication" src="/images/rss.png" />),
    %(image_tag("rss.png", :alt => "")) => %(<img alt="" src="/images/rss.png" />),
    %(image_tag("gold.png", :size => "45x70")) => %(<img alt="" height="70" src="/images/gold.png" width="45" />),
    %(image_tag("symbolize.png", "size" => "45x70")) => %(<img alt="" height="70" src="/images/symbolize.png" width="45" />),
    %(image_tag("http://www.rubyonrails.com/images/rails.png")) => %(<img alt="" src="http://www.rubyonrails.com/images/rails.png" />)
  }

  def test_stylesheet_link_tag
    ENV["RAILS_ASSET_ID"] = ""
    ImageLinkToTag.each { |method, tag| assert_dom_equal(tag, eval(method)) }
  end

end
