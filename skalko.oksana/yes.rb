class Task2

  HASH = {'Yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234', yesss: :fg, try: 30, key: 'some value', ' yesterday1 '=> 34,' yesteryear '=> 2014}

  def items
    yes_elements.length
  end

  private

  def hash_keys
    HASH.keys
  end

  def to_string
    hash_keys.map(&:to_s)
  end
  
  def down_case
    to_string.map(&:downcase)
  end

  def yes_elements
    down_case.select { |str| str.start_with?('yes') }
  end
end

p Task2.new.items
