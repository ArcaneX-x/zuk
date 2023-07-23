module Illustrations
  # class for logging
  class Mirror
    attr_reader :surface

    def initialize(surface = Rails.logger)
      @surface = surface
    end

    def reflect_start(object)
      surface.info "Story starts: #{object}"
    end

    def reflect_end(object)
      surface.info "Story ends: #{object}"
    end
  end
end
