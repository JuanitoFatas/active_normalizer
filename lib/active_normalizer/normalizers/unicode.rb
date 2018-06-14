# frozen_string_literal: true

ActiveNormalizer.require_dependency(
  "unicode",
  "ActiveNormalizer::Normalizers::Unicode"
)

# https://github.com/blackwinter/unicode
class ActiveNormalizer
  module Normalizers
    class Unicode < Normalizer
      def initialize(normalization_form = nil)
        @normalization_form = normalization_form
      end

      def run(text)
        case normalization_form
        when :nfd
          ::Unicode.nfd(text)
        when :nfc
          ::Unicode.nfc(text)
        when :nfkd
          ::Unicode.nfkd(text)
        when :nfkc
          ::Unicode.nfkc(text)
        else
          raise_unknown_form_error(normalization_form)
        end
      end

      private

      attr_reader :normalization_form
    end
  end
end
