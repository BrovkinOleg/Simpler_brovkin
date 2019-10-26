class TestsController < Simpler::Controller
  def index
    @time = Time.now
    status(201)
    headers_set
    render_box(plain: @time.to_s)
  end

  def show
    @params = params
  end

  def create; end
end
