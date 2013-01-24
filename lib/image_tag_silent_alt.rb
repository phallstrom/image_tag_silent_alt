require "image_tag_silent_alt/version"
require "action_view"

module ImageTagSilentAlt
  module ActionViewExtensions

      def image_tag(source, options = {})
        options.symbolize_keys!
        options[:alt] ||= ''
        super
      end

  end
end

ActionView::Base.send :include, ImageTagSilentAlt::ActionViewExtensions
