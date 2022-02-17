class IsbnConverter
  attr_accessor :isbn_digits

  def initialize(isbn_digits)
    @isbn_digits = isbn_digits
  end

  def convert
    raise 'The ISBN should contain only numbers and a length of 20.' unless digits_is_valid?

    fetch_convert_isbn.to_s
  end

  private

  def fetch_convert_isbn
    mod_result == 10 ? mod_result.push(0).join.to_i : digits_to_array.push(10 - mod_result).join.to_i
  end

  def digits_is_valid?
    return false if digits_length > 12 || digits_length < 12 || !digits_only_numbers?

    true
  end

  def digits_length
    isbn_digits.to_s.length
  end

  def digits_only_numbers?
    isbn_digits.to_s !~ /\D/
  end

  def digits_to_array
    isbn_digits.to_s.chars.map(&:to_i)
  end

  def array_index_even
    digits_to_array.select.each_with_index { |_, i| i.even? }
  end

  def array_index_odd
    digits_to_array.select.each_with_index { |_, i| i.odd? }
  end

  def mod_result
    (array_index_even.map{ |i| i * 1 } + array_index_odd.map{ |i| i * 3 }).inject(&:+) % 10
  end
end

