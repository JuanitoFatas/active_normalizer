# Active Normalizer

Normalize weird Japanese characters, see [tests](/spec) for examples.

Normalize fullwidth, halfwidth hiragana, katakana, symbols.

## Usage

Each normalizer class accepts option of `:nfc`, `:nfd`, `:nfkd`, `:nfkc` (See [Normalization Forms][unicode-nf] for more information).
Each normalizer instance responds to `run`.

```ruby
require "active_normalizer/normalizers/ruby"
nfkc_normalizer = ActiveNormalizer.new(
  ActiveNormalizer::Normalizers::Ruby,
  options: :nfkc
)
nfkc_normalizer.run(input)
```

## Benchmark

```
Benchmarking simple string: ８００ー1234５
Warming up --------------------------------------
                 UNF    92.981k i/100ms
             Unicode    36.002k i/100ms
                Ruby    17.044k i/100ms
        UnicodeUtils    12.681k i/100ms
       ActiveSupport     7.482k i/100ms
Calculating -------------------------------------
                 UNF      1.173M (±17.6%) i/s -      5.672M in   5.041037s
             Unicode    404.502k (± 6.8%) i/s -      2.016M in   5.008748s
                Ruby    191.562k (±30.3%) i/s -    835.156k in   5.106057s
        UnicodeUtils    132.477k (± 5.3%) i/s -    672.093k in   5.088759s
       ActiveSupport     75.011k (±34.9%) i/s -    329.208k in   5.058559s

Comparison:
                 UNF:  1172663.8 i/s
             Unicode:   404502.1 i/s - 2.90x  slower
                Ruby:   191562.4 i/s - 6.12x  slower
        UnicodeUtils:   132477.3 i/s - 8.85x  slower
       ActiveSupport:    75010.6 i/s - 15.63x  slower

Warming up --------------------------------------
                 UNF    67.181k i/100ms
             Unicode    31.572k i/100ms
                Ruby    14.947k i/100ms
        UnicodeUtils    12.443k i/100ms
       ActiveSupport     5.561k i/100ms
Calculating -------------------------------------
                 UNF    997.098k (±25.2%) i/s -     27.477M in  30.052018s
             Unicode    328.071k (±19.5%) i/s -      9.503M in  30.090451s
                Ruby    177.045k (±32.8%) i/s -      4.529M in  30.071040s
        UnicodeUtils    134.513k (± 6.7%) i/s -      4.019M in  30.059621s
       ActiveSupport     68.063k (±44.7%) i/s -      1.668M in  30.131968s

Comparison:
                 UNF:   997097.6 i/s
             Unicode:   328070.8 i/s - 3.04x  slower
                Ruby:   177044.6 i/s - 5.63x  slower
        UnicodeUtils:   134512.7 i/s - 7.41x  slower
       ActiveSupport:    68063.1 i/s - 14.65x  slower


Benchmarking longer string: ㍻㍼㍽㍾㌀㌁㌂㌃㌄㌅㌆㌇㌈㌉㌊㌋㌌㌍㌎㌏㌐㌑㌒㌓㌔㌕㌖㌗㌘㌙㌚㌛㌜㌝㌞㌟㌠㌡㌢㌣㌤㌥㌦㌧㌨㌩㌪㌫㌬㌭㌮㌯㌰㌱㌲㌳㌴㌵㌶㌷㌸㌹㌺㌻㌼㌽㌾㌿㍀㍁㍂㍃㍄㍅㍆㍇㍈㍉㍊㍋㍌㍍㍎㍏㍐㍑㍒㍓㍔㍕㍖㍗
Warming up --------------------------------------
                 UNF     6.023k i/100ms
             Unicode     1.238k i/100ms
                Ruby     1.068k i/100ms
        UnicodeUtils   319.000  i/100ms
       ActiveSupport   258.000  i/100ms
Calculating -------------------------------------
                 UNF     59.891k (± 6.8%) i/s -    301.150k in   5.055411s
             Unicode     11.740k (± 9.0%) i/s -     59.424k in   5.103353s
                Ruby     10.655k (±10.9%) i/s -     53.400k in   5.091860s
        UnicodeUtils      3.087k (± 8.9%) i/s -     15.312k in   5.004688s
       ActiveSupport      2.533k (±11.1%) i/s -     12.642k in   5.064477s

Comparison:
                 UNF:    59890.8 i/s
             Unicode:    11740.2 i/s - 5.10x  slower
                Ruby:    10655.0 i/s - 5.62x  slower
        UnicodeUtils:     3087.4 i/s - 19.40x  slower
       ActiveSupport:     2532.6 i/s - 23.65x  slower

Warming up --------------------------------------
                 UNF     5.739k i/100ms
             Unicode     1.122k i/100ms
                Ruby     1.113k i/100ms
        UnicodeUtils   312.000  i/100ms
       ActiveSupport   254.000  i/100ms
Calculating -------------------------------------
                 UNF     59.371k (± 4.4%) i/s -      1.779M in  30.026571s
             Unicode     10.780k (±17.3%) i/s -    310.794k in  30.106556s
                Ruby     11.144k (± 6.7%) i/s -    332.787k in  30.034689s
        UnicodeUtils      3.164k (± 4.9%) i/s -     94.848k in  30.056928s
       ActiveSupport      2.635k (± 8.8%) i/s -     78.486k in  30.075836s

Comparison:
                 UNF:    59371.2 i/s
                Ruby:    11143.9 i/s - 5.33x  slower
             Unicode:    10779.6 i/s - 5.51x  slower
        UnicodeUtils:     3163.5 i/s - 18.77x  slower
       ActiveSupport:     2635.3 i/s - 22.53x  slower
```

Benchmark code can be found at [bin/benchmark](bin/benchmark).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "active_normalizer"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_normalizer

## Dependnecies

Active Normalizer provides a handful of normalizers. Their dependencies are not bundled except for one that utilizes standard library. You must bundle the normalizer's gem dependency.

#### ActiveNormalizer::Normalizers::Ruby

```ruby
# no dependency required, standard library

require "active_normalizer/normalizers/ruby"
```

#### ActiveNormalizer::Normalizers::UNF - unf

```ruby
gem "unf"

require "active_normalizer/normalizers/unf"
```

#### ActiveNormalizer::Normalizers::Unicode - unicode

```ruby
gem "unicode"

require "active_normalizer/normalizers/unicode"
```

#### ActiveNormalizer::Normalizers::UnicodeUtils - unicode_utils

```ruby
gem "unicode_utils"

require "active_normalizer/normalizers/unicode_utils"
```

#### ActiveNormalizer::Normalizers::ActiveSupportMultibyte - active_support

```ruby
gem "active_support"

require "active_normalizer/normalizers/active_support"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/hack` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanitoFatas/active_normalizer.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[unicode-nf]: http://unicode.org/reports/tr15/#Norm_Forms
