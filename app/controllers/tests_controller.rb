class TestsController < Simpler::Controller

  def index
    @time = Time.now
    status 201
    headers['Content-Type'] = 'text/plain'
    render plain: @time.to_s
  end

  def show
    @params = params
  end

  def create

  end

end
