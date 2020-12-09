class Task1
  def result
    puts array.inspect
    puts positive
    puts sum
  end

  private

  def initialize
    array
    positive
    sum
  end

  def array
    @array ||= Array.new(3) { Array.new(3) { rand(-10..10)} }
  end

  def positive
    @positive ||= array.flatten.map { |el| el if el.positive? }.compact
  end

  def sum
    @sum ||= positive.sum
  end
end

Task1.new.result
