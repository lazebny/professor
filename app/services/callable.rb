module Callable
  extend ::ActiveSupport::Concern

  included do
    def self.call(*args, &block)
      new.call(*args, &block)
    end
  end
end
