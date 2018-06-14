# frozen_string_literal: true

require "active_normalizer/normalizers/unf"
require "active_normalizer/normalizers/unicode"
require "active_normalizer/normalizers/ruby"
require "active_normalizer/normalizers/unicode_utils"
require "active_normalizer/normalizers/active_support"

RSpec.describe "Fullwidth ASCII variants" do
  class UnicodeFullwidthAsciiVariants
    # ！＂＃＄％＆＇（）＊＋，－．／０１２３４５６７８９：；＜＝＞？
    # ＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾
    # ＿｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～
    Chars = UnicodeRange.new(from: "FF01", to: "FF5E").
      expand.pack("U*")
  end

  let(:input) { UnicodeFullwidthAsciiVariants::Chars }
  let(:expected) { UnicodeRange.new(from: "0021", to: "007E").expand.pack("U*") }

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
