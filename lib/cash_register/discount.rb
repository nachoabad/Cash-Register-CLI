require 'forwardable'

class Discount
  extend Forwardable

  def_delegators :@rule,   :applicable?
  def_delegators :@action, :compute_total

  def initialize(rule:, action:)
    @rule = rule
    @action = action
  end
end
