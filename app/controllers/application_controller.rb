class ApplicationController < ActionController::Base
  def link_resolver
    @link_resolver ||= Prismic::LinkResolver.new(nil) do |link|
      # URL for the category type
      if link.type == 'category'
        '/category/' + link.uid

      # URL for the product type
      elsif link.type == 'product'
        '/product/' + link.id

      # Default case for all other types
      else
        '/'
      end
    end
  end
end
