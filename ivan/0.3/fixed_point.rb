class FixedPoint
  def f(x)
    x/2
  end
end

require 'minitest/autorun'

describe FixedPoint do
  describe '#result' do
    it "should have 0 as fixe" do
      FixedPoint.new.f(0).must_equal 0
    end
  end
end
