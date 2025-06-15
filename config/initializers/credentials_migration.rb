# Migration from secrets to credentials
Rails.application.config.after_initialize do
  # Map secrets to credentials for backward compatibility
  Rails.application.secrets.each_pair do |key, value|
    next if Rails.application.credentials.send(key).present?
    Rails.application.credentials[key] = value
  end
end

# Silence deprecation warnings before Rails loads
begin
  require 'did_you_mean'

  # Monkey patch DidYouMean to prevent deprecation warnings
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
rescue LoadError
  # DidYouMean gem not available
end
