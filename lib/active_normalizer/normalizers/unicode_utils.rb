# frozen_string_literal: true

ActiveNormalizer.require_dependency(
  "unicode_utils",
  "ActiveNormalizer::Normalizers::UnicodeUtils"
)

# https://github.com/lang/unicode_utils
class ActiveNormalizer
  module Normalizers
    class UnicodeUtils < Normalizer
      def initialize(normalization_form = nil)
        @normalization_form = normalization_form
      end

      def run(text)
        case normalization_form
        when :nfd
          ::UnicodeUtils.nfd(text)
        when :nfc
          ::UnicodeUtils.nfc(text)
        when :nfkd
          ::UnicodeUtils.nfkd(text)
        when :nfkc
          ::UnicodeUtils.nfkc(text)
        else
          raise_unknown_form_error(normalization_form)
        end
      end

      private

      attr_reader :normalization_form
    end
  end
end
