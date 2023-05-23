class BlogPostsController < ApplicationController
  layout 'application'
  before_action :api
  def index
    response = @api.query(Prismic::Predicates.at('document.type', 'blogpost'))
    @documents = response.results
  end

  def show
    @document = @api.getByID(params[:id])
  end

  private

  def api
    @api = Prismic.api('https://roberto-blog.cdn.prismic.io/api/v1')
  end
end
