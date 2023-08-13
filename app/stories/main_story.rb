# base interactor class: logging, errors handling, monads-like behaviour
class MainStory
  attr_reader :params
  attr_accessor :consequences, :bad_twists

  mattr_accessor :mirror

  def initialize(mirror = Illustrations::Mirror.new, params)
    self.class.mirror = mirror
    @bad_twists = {}
    @params = params
  end

  def self.call(...)
    story = new(...)

    mirror.reflect_start(story)
    telling = listen_carefully { story.call }
    mirror.reflect_end(story)

    telling
  end
  private_class_method :new

  whispers

  def self.listen_carefully
    catch(:wolf!) do
      yield
    end
  end

  # здесь должен быть код, который вызывает ошибку, но не критичную
  def howl_in_the_distance(crisis_plot)
    bad_twists.merge!(crisis_plot)
  end

  # здесь должен быть код, который вызывает ошибку, но критичную
  def wolves!(telling, crisis_plot)
    bad_twists.merge!(crisis_plot)
    throw(:wolf!, telling)
  end

  shouts

  def bad_ending?
    bad_twists.any?
  end

  def good_ending?
    bad_twists.empty?
  end

  def to_s
    "Story: #{self.class.name}, params: #{params}, result: #{consequences}, errors: #{bad_twists}"
  end
end
