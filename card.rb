class Card
  attr_reader :value, :suit

  VALUE_MAP = {
    '2' => 2,  '3' => 3,  '4' => 4,  '5' => 5,  '6' => 6,
    '7' => 7,  '8' => 8,  '9' => 9,  'T' => 10, 'J' => 11,
    'Q' => 12, 'K' => 13, 'A' => 14
  }

  def initialize(code)
    @value = VALUE_MAP[code[0]]
    @suit = code[1]
  end
end
