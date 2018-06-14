# frozen_string_literal: true

ActiveNormalizer.require_dependency(
  "active_support/multibyte/unicode",
  "ActiveNormalizer::Normalizers::ActiveSupport"
)

# http://api.rubyonrails.org/classes/ActiveSupport/Multibyte/Unicode.html#method-i-normalize
class ActiveNormalizer
  module Normalizers
    class ActiveSupport < Normalizer
      def initialize(normalization_form = nil)
        @normalization_form = normalization_form
      end

      def run(text)
        case normalization_form
        when :nfd
          ::ActiveSupport::Multibyte::Unicode.normalize(text, :d)
        when :nfc
          ::ActiveSupport::Multibyte::Unicode.normalize(text, :c)
        when :nfkd
          ::ActiveSupport::Multibyte::Unicode.normalize(text, :kd)
        when :nfkc
          ::ActiveSupport::Multibyte::Unicode.normalize(text, :kc)
        else
          raise_unknown_form_error(normalization_form)
        end
      end

      private

      attr_reader :normalization_form
    end
  end
end
