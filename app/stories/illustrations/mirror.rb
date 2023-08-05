module Illustrations
  # class for logging
  class Mirror
    attr_reader :surface

    def initialize(surface: Rails.logger)
      @surface = surface
    end

    def reflect_start(object)
      reflect "Story starts: #{object}"
    end

    def reflect_end(object)
      reflect "Story ends: #{object}"
    end

    whispers

    def reflect(something)
      surface.info "\n #{something}"
    end
  end
end
