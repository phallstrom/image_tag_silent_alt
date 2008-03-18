#
# Default to alt="" unless already set. An alt tag set to the image filename
# is rarely useful.
#
module ActionView
  module Helpers
    module AssetTagHelper

      alias_method :image_tag_orig, :image_tag

      def image_tag(source, options = {})
        options.symbolize_keys!
        options[:alt] ||= ''
        image_tag_orig(source, options)
      end

    end
  end
end
