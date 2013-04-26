module MnClient
  module API
    module Note

      def all_notes(options={})
        get "/notes/all", options
      end

      def find_notes(options={})
        get "/notes/all", options
      end
    end
  end
end

