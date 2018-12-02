class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_query_params(request)
    url = request.original_url
    uri = URI.parse(url)
    uri.query.nil? ? {} : CGI.parse(uri.query)
  end
end
