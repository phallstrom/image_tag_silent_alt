require 'rubygems'

['actionpack/lib', 'actionpack/lib/action_view'].each do |p|
  path = File.dirname(__FILE__) + "/../../../rails/#{p}"
  next unless File.directory?(path)
  $:.unshift(path)
end

require 'action_controller'
require 'action_controller/assertions'
require 'action_view'

require File.dirname(__FILE__) + "/../lib/image_tag_silent_alt.rb"

require 'test/unit'

class ImageTagSilentAltTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  def setup
    @controller = Class.new do

      attr_accessor :request
    
      def url_for(options, *parameters_for_method_reference)
        "http://www.example.com"
      end
      
    end.new
    
    @request = Class.new do 
      def relative_url_root
        ""
      end       

      def protocol
        'http://'
      end
    end.new

    @controller.request = @request
    
    ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
  end

  def teardown
    Object.send(:remove_const, :RAILS_ROOT) if defined?(RAILS_ROOT)
    ENV["RAILS_ASSET_ID"] = nil
  end

  ImageLinkToTag = {
    %(image_tag("xml.png")) => %(<img alt="" src="/images/xml.png" />),
    %(image_tag("rss.png", :alt => "rss syndication")) => %(<img alt="rss syndication" src="/images/rss.png" />),
    %(image_tag("rss.png", :alt => "")) => %(<img alt="" src="/images/rss.png" />),
    %(image_tag("gold.png", :size => "45x70")) => %(<img alt="" height="70" src="/images/gold.png" width="45" />),
    %(image_tag("symbolize.png", "size" => "45x70")) => %(<img alt="" height="70" src="/images/symbolize.png" width="45" />),
    %(image_tag("http://www.rubyonrails.com/images/rails.png")) => %(<img alt="" src="http://www.rubyonrails.com/images/rails.png" />)
  }

  def test_image_tag
    ImageLinkToTag.each { |method, tag| assert_dom_equal(tag, eval(method)) }
  end

end
