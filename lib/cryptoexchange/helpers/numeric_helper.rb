class NumericHelper
  class << self
    def to_d(number)
      if !number.nil? || number != ""
        num = number.to_s
        num.empty? ? nil : BigDecimal(num)
      else
        nil
      end
    rescue
      nil
    end

    def divide(number, divisor)
      result = number / divisor
      result.nan? || result.infinite? ? 0 : result
    rescue
      0
    end

    def to_numeric(number)
      result = BigDecimal.new(number.to_s)
      if result.frac.zero?
        result.to_i
      else
        result.to_f
      end
    end

    def flip_volume(volume, last)
      if volume.nil? || last.nil? || last == 0
        nil
      else
        volume / last
      end
    end
  end
end
