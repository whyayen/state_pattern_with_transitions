class LockState
  include State

  def initialize
    @value = :lock
  end
end