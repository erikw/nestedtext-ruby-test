require 'nestedtext'

class Apple
  include NestedText::NTEncodeMixin
  def initialize(type, weight)
    @type = type
    @weight = weight
  end

  def self.nt_create(data)
    new(*data)
  end

  def encode_nt_with
    state
  end

  def ==(other)
    other.class == self.class && other.state == state
  end
  alias eql? ==

  protected

  def state
    [@type, @weight]
  end
end
