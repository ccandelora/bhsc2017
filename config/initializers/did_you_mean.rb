# Configure did_you_mean gem to use the new API
if defined?(DidYouMean)
  # Silence the deprecation warning by monkey patching the deprecated method
  module DidYouMean
    def self.correct_error(error_name, spell_checker)
      SPELL_CHECKERS[error_name] = spell_checker
    end

    class << self
      alias :spell_checkers :SPELL_CHECKERS unless method_defined?(:spell_checkers)
    end
  end
end
