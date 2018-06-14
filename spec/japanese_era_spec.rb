# frozen_string_literal: true

require "active_normalizer/normalizers/unf"
require "active_normalizer/normalizers/unicode"
require "active_normalizer/normalizers/ruby"
require "active_normalizer/normalizers/unicode_utils"
require "active_normalizer/normalizers/active_support"

RSpec.describe "Japanese Era" do
  class UnicodeJapaneseEra
    # ㍻㍼㍽㍾
    Chars = UnicodeRange.new(from: "337B", to: "337E").expand.pack("U*")
  end

  let(:input) { UnicodeJapaneseEra::Chars }
  let(:expected) { %(平成昭和大正明治) }

  it "ActiveNormalizer::Normalizers::UNF works" do
    normalizer = ActiveNormalizer::Normalizers::UNF.new(:nfkc)

    result = normalizer.run(input)

    expect(result).to eq expected
  end

  it "ActiveNormalizer::Normalizers::Unicode works" do
    normalizer = ActiveNormalizer::Normalizers::Unicode.new(:nfkc)

    result = normalizer.run(input)

    expect(result).to eq expected
  end

  it "ActiveNormalizer::Normalizers::Ruby works" do
    normalizer = ActiveNormalizer::Normalizers::Ruby.new(:nfkc)

    result = normalizer.run(input)

    expect(result).to eq expected
  end

  it "ActiveNormalizer::Normalizers::UnicodeUtils works" do
    normalizer = ActiveNormalizer::Normalizers::Unicode.new(:nfkc)

    result = normalizer.run(input)

    expect(result).to eq expected
  end

  it "ActiveNormalizer::Normalizers::ActiveSupport works" do
    normalizer = ActiveNormalizer::Normalizers::ActiveSupport.new(:nfkc)

    result = normalizer.run(input)

    expect(result).to eq expected
  end
end
