require 'context'

class Demo
  attr_accessor :context

  def initialize
    @context = Context.new

    p "----"
    p "Init: #{@context.state.value}"
    p "---"
  end
end