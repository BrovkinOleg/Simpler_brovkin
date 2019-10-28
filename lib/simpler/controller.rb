require_relative 'view'

module Simpler
  class Controller
    attr_reader :name, :request, :response

    def initialize(env)
      @name = extract_name
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
    end

    def make_response(action)
      @request.env['simpler.controller'] = self
      @request.env['simpler.action'] = action

      set_default_headers
      send(action)
      write_response

      @response.finish
    end

    private

    def extract_name
      self.class.name.match('(?<name>.+)Controller')[:name].downcase
    end

    def set_default_headers
      @response['Content-Type'] = 'text/html'
    end

    def write_response
      @response.write(render_body) if @response.body.empty?
    end

    def render_body
      View.new(@request.env).render_view(binding)
    end

    def plain_mode(text)
      @request.env['simpler.plain'] = text
    end

    def params
      @request.env['simpler.params'].merge!(@request.params)
    end

    def render_box(template)
      @request.env['simpler.template'] = template
    end

    def status(code)
      @response.status = code
    end

    def headers_set
      @response['Content-Type'] = 'text/plain'
    end
  end
end
