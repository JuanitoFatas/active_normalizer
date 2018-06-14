# frozen_string_literal: true

# @since Ruby 2.2.0-preview2
class ActiveNormalizer
  module Normalizers
    class Ruby < Normalizer
      def initialize(normalization_form = nil)
        @normalization_form = normalization_form
      end

      def run(text)
        case normalization_form
        when :nfd
          text.unicode_normalize(:nfd)
        when :nfc
          text.unicode_normalize(:nfc)
        when :nfkd
          text.unicode_normalize(:nfkd)
        when :nfkc
          text.unicode_normalize(:nfkc)
        else
          raise_unknown_form_error(normalization_form)
        end
      end

      private

      attr_reader :normalization_form
    end
  end
end
