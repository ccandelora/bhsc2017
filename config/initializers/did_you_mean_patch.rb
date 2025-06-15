# Monkey patch DidYouMean to prevent deprecation warnings
if defined?(DidYouMean)
  module DidYouMean
    class << self
      alias_method :original_spell_checkers, :spell_checkers if method_defined?(:spell_checkers)

      def spell_checkers
        @spell_checkers ||= {}
      end

      def correct_error(error_name, spell_checker)
        spell_checkers[error_name] = spell_checker
      end
    end

    # Ensure SPELL_CHECKERS still works but without warnings
    unless const_defined?(:SPELL_CHECKERS)
      SPELL_CHECKERS = spell_checkers
    end
  end
end
