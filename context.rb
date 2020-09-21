require 'states/close_state'
require 'states/lock_state'
require 'states/open_state'

class Context
  attr_accessor :state

  def initialize
    @state = OpenState.new
  end
  
  # transitions
end