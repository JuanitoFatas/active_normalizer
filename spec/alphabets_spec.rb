# frozen_string_literal: true

require "active_normalizer/normalizers/unf"
require "active_normalizer/normalizers/unicode"
require "active_normalizer/normalizers/ruby"
require "active_normalizer/normalizers/unicode_utils"
require "active_normalizer/normalizers/active_support"

RSpec.describe "Alphabets" do
  class UnicodeAlphabets
    RESERVED = %w(FF3B FF3C FF3D FF3E FF3F FF40)
    private_constant :RESERVED

    # ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ
    Chars = UnicodeRange.new(from: "FF21", to: "FF5A").
      expand(except: RESERVED).pack("U*")
  end

  let(:input) { UnicodeAlphabets::Chars }
  let(:expected) { %(ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz) }

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
