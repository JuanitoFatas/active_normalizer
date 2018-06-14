# frozen_string_literal: true

ActiveNormalizer.require_dependency(
  "unf",
  "ActiveNormalizer::Normalizers::UNF"
)

# https://github.com/blackwinter/unicode
class ActiveNormalizer
  module Normalizers
    class UNF < Normalizer
      def initialize(normalization_form = nil)
        @normalization_form = normalization_form
      end

      def run(text)
        case normalization_form
        when :nfd
          unf_normalizer.normalize(text, :nfd)
        when :nfc
          unf_normalizer.normalize(text, :nfc)
        when :nfkd
          unf_normalizer.normalize(text, :nfkd)
        when :nfkc
          unf_normalizer.normalize(text, :nfkc)
        else
          raise_unknown_form_error(normalization_form)
        end
      end

      private

      attr_reader :normalization_form, :unf_normalizer

      def unf_normalizer
        @_unf_normalizer ||= ::UNF::Normalizer.instance
      end
    end
  end
end
