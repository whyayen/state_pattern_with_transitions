require 'states/close_state'
require 'states/lock_state'
require 'states/open_state'
require 'transitions/door_transitions.rb'

class Context
  attr_accessor :state

  def initialize
    @state = OpenState.new

    transitions = [
      :close_door,
      :lock_door,
      :unlock_door,
      :open_door
    ]

    from = {
      close_door: [:open],
      lock_door: [:close],
      unlock_door: [:lock],
      open_door: [:close]
    }

    to = {
      close_door: 'CloseState',
      lock_door: 'LockState',
      unlock_door: 'CloseState',
      open_door: 'OpenState'
    }

    transitions.each do |transition|
      self.class.send(:define_method, transition) do |*args, &block|
        if from[transition].include?(@state.value)
          @state = Object.const_get(to[transition]).new
        else
          raise ArgumentError 'invalid state'
        end
      end
    end
  end

  # transitions
end