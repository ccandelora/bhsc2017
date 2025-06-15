# Silence deprecation warnings in development
if Rails.env.development?
  ActiveSupport::Deprecation.silenced = true

  # Monkey patch DidYouMean to use the new API
  if defined?(DidYouMean)
    module DidYouMean
      def self.correct_error(error_name, spell_checker)
        SPELL_CHECKERS[error_name] = spell_checker
      end
    end
  end
end
