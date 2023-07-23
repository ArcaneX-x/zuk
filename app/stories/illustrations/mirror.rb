module Illustrations
  # class for logging
  class Mirror < MainStory
    attr_reader :surface

    def initialize(surface = Rails.logger)
      @surface = surface
    end

    def reflect_start(object)
      surface.info "Story starts: #{object.class.name}, params: #{object.params}"
    end

    def reflect_end(object)
      surface.info "Story ends: #{object.class.name}, params: #{object.params}"
    end
  end
end
