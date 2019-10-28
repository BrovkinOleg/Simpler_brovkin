class TestsController < Simpler::Controller
  def index
    @time = Time.now
    status(201)
    plain_mode('erb') #'plain'
  end

  def show
    plain_mode('erb') #'plain'
    @params = params
  end

  def create; end
end
