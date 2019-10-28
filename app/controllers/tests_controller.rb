class TestsController < Simpler::Controller
  def index
    @time = Time.now
    status(201)
    headers_set
    # plain_mode('plain')
    plain_mode('erb')
  end

  def show
    # plain_mode('plain')
    plain_mode('erb')
    @params = params
  end

  def create; end
end
