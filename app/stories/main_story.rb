# base interactor class: logging, errors handling, monads-like behaviour
class MainStory
  attr_reader :params, :mirror
  attr_accessor :consequences, :bad_twists

  def initialize(params, mirror = Illustrations::Mirror.new)
    @params = params
    @mirror = mirror
    @bad_twists = []
  end

  def self.call(args)
    story = new(**args)

    story = listen_carefully do
      reflect_start
      story.call
      reflect_end
    end

    story
  end

  whispers

  # здесь должен быть код, который вызывает ошибку, но не критичную
  def howl_in_the_distance(crisis_plot)
    bad_twists << crisis_plot
  end

  # здесь должен быть код, который вызывает ошибку, но критичную
  def wolves!(telling, crisis_plot)
    bad_twists << crisis_plot
    throw(:wolf!, telling)
  end

  def listen_carefully
    catch(:wolf!) do
      yield
    end
  end

  shouts

  def bad_ending?
    bad_twists.any?
  end

  def good_ending?
    bad_twists.empty?
  end
end
