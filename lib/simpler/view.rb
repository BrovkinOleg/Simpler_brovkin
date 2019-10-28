require 'erb'

module Simpler
  class View
    VIEW_BASE_PATH = 'app/views'.freeze

    def initialize(env)
      @env = env
    end

    def render_view(binding)
      template = File.read(template_path)

      erb = ERB.new(template).result(binding)
      case @env['simpler.mode']
      when 'erb'   then erb
      when 'plain' then template
      else erb
      end
    end

    private

    def controller
      @env['simpler.controller']
    end

    def action
      @env['simpler.action']
    end

    def template
      @env['simpler.template']
    end

    def template_path
      path = template || [controller.name, action].join('/')

      Simpler.root.join(VIEW_BASE_PATH, "#{path}.html.erb")
    end
  end
end
