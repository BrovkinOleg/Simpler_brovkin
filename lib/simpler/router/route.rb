module Simpler
  class Router
    class Route
      attr_reader :controller, :action, :params

      def initialize(method, path, controller, action)
        @method = method
        @router_path = array(path)
        @controller = controller
        @action = action
      end

      def match?(method, path)
        @method == method && check_path(path)
      end

      private

      def check_path(path)
        @params = {}
        @request = array(path)
        return false if @request.nil?
        return false if @request.size != @router_path.size

        if path_match?(@router_path[0], @request[0])
          add_params(@router_path[1], @request[1])
          true
        end
      end

      def path_match?(one, two)
        one == two
      end

      def add_params(parameter, value)
        return if parameter.nil?

        symbol = parameter.split(':')[1].to_sym
        @params[symbol] = value if parameter[0] == ':'
      end

      def array(path)
        path.split('/').reject!(&:empty?)
      end
    end
  end
end
