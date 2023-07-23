# base interactor class: logging, errors handling, monads-like behaviour
class MainStory
  attr_reader :params
  attr_accessor :consequences, :bad_twists

  class << self
    attr_accessor :mirror
  end

  def initialize(params, mirror = Illustrations::Mirror.new)
    self.class.mirror = mirror
    @bad_twists = {}
    @params = params
  end

  def self.call(args)
    story = new(**args)

    story = listen_carefully do
      mirror.reflect_start(story)
      story.call
      mirror.reflect_end(story)
    end

    story
  end

  whispers

  def self.listen_carefully
    catch(:wolf!) do
      yield
    end
  end

  # здесь должен быть код, который вызывает ошибку, но не критичную
  def howl_in_the_distance(crisis_plot)
    bad_twists << crisis_plot
  end

  # здесь должен быть код, который вызывает ошибку, но критичную
  def wolves!(telling, crisis_plot)
    bad_twists << crisis_plot
    throw(:wolf!, telling)
  end

  shouts

  def bad_ending?
    bad_twists.any?
  end

  def good_ending?
    bad_twists.empty?
  end
end
