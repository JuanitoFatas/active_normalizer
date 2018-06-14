# frozen_string_literal: true

class ActiveNormalizer
  module Normalizers
    class Normalizer
      class UnknownNormalizationFormError < StandardError
        def initialize(form)
          super error_message_for(form)
        end

        private

        def error_message_for(form)
          "Unexpected normalization form: '#{form}'. Expected symbols :nfd, :nfc, :nfkd, :nfkc. See http://unicode.org/reports/tr15/#Norm_Forms for more information."
        end
      end

      def raise_unknown_form_error(form)
        raise UnknownNormalizationFormError, form
      end
    end
  end
end
