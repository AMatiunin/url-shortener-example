class UrlController < ApplicationController

  def short
    if params.permit(:full_url)[:full_url].blank?

      render json: { message: "Need URL" }
    else
      short_url = Shortener.shorts_url(params.permit(:full_url)[:full_url], request.host)

      render json: { short_url: short_url, status: 200 }
    end
  end

  def find
    if params.permit(:short_url)[:short_url].blank?

      render json: { message: "Need URL" }
    else
      url = manage_url

      render json: { full_url: url.full_url, timestamp: url.created_at, status: 200 }
    end
  end

  def index
    render json: { message: "Please use URL /short to get your shortened_url" }
  end

  def catch
    url = manage_url

    redirect_to url
  end

  private

  def manage_url
    Shortener.get_url(params.permit(:short_url)[:short_url])
  end
end
