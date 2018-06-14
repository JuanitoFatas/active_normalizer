class UnicodeRange
  def initialize(from:, to:)
    @from = from.to_i(16)
    @to = to.to_i(16)
  end

  def expand(except: [])
    [*from..to].select do |codepoint|
      not except.any? { |exclude| ceq(to_hex(codepoint), exclude) }
    end
  end

  private

  attr_reader :from, :to

  def to_hex(int)
    int.to_s(16)
  end

  def ceq(x, y)
    x.casecmp(y) == 0
  end
end
