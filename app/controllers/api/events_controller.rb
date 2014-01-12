class Api::EventsController < ApiController
  def index
    render json: Activity.all 
  end
end

