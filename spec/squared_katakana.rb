# frozen_string_literal: true

require "active_normalizer/normalizers/unf"
require "active_normalizer/normalizers/unicode"
require "active_normalizer/normalizers/ruby"
require "active_normalizer/normalizers/unicode_utils"
require "active_normalizer/normalizers/active_support"

RSpec.describe "Squared Katakana" do
  class UnicodeSquaredKatakana
    # ㌀㌁㌂㌃㌄㌅㌆㌇㌈㌉㌊㌋㌌㌍㌎㌏㌐㌑㌒㌓㌔㌕㌖㌗㌘㌙㌚㌛㌜㌝㌞㌟㌠㌡㌢㌣㌤㌥㌦㌧㌨㌩㌪㌫㌬㌭㌮㌯㌰㌱㌲㌳㌴㌵㌶㌷㌸㌹㌺㌻㌼㌽㌾㌿㍀㍁㍂㍃㍄㍅㍆㍇㍈㍉㍊㍋㍌㍍㍎㍏㍐㍑㍒㍓㍔㍕㍖㍗
    Chars = UnicodeRange.new(from: "3300", to: "3357").expand.pack("U*")
  end

  let(:input) { UnicodeSquaredKatakana::Chars }
  let(:expected) { %(アパートアルファアンペアアールイニングインチウォンエスクードエーカーオンスオームカイリカラットカロリーガロンガンマギガギニーキュリーギルダーキロキログラムキロメートルキロワットグラムグラムトンクルゼイロクローネケースコルナコーポサイクルサンチームシリングセンチセントダースデシドルトンナノノットハイツパーセントパーツバーレルピアストルピクルピコビルファラッドフィートブッシェルフランヘクタールペソペニヒヘルツペンスページベータポイントボルトホンポンドホールホーンマイクロマイルマッハマルクマンションミクロンミリミリバールメガメガトンメートルヤードヤールユアンリットルリラルピールーブルレムレントゲンワット) }

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
