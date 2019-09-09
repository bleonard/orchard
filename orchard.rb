class Orchard
  
  def initialize(basket_strategy: :most, basket_count: 2)
    @basket_strategy = basket_strategy # least, random, single
    @basket_count = basket_count

    @pieces = {
      bird: 9,
      apple: 10,
      blueberry: 10,
      cherry: 10,
      pear: 10
    }
    @die = @pieces.keys + [:basket]
    @fruits = @pieces.keys - [:bird]
    
    @winner = nil
    @last_rolled = nil
  end

  def play!(log)
    while !winner?
      roll!
      puts to_s if log
    end
  end

  def roll!
    rolled = generate_random_symbol
    case rolled
    when :basket
      use_basket!
    else
      use_fruit!(rolled)
    end

    @last_rolled = rolled
  end

  def to_s
    out = []
    if @last_rolled
      out << "Rolled: #{@last_rolled}"
    end

    @fruits.each do |fruit|
      out << "#{fruit}: #{@pieces[fruit]}"
    end

    out << "bird: #{@pieces[:bird]}"

    if winner
      out << "WINNER: #{winner}"
    end
    out.join(" | ")
  end

  def winner
    @winner
  end

  def winner?
    !!@winner
  end

  private
  
  def check_game!
    @winner = find_winner
    !!@winner
  end

  def get_empty_item
    @pieces.each do |key, value|
      return key if value <= 0
    end
    nil
  end

  def find_winner
    if @pieces[:bird] <= 0
      return :bird
    end
    @fruits.each do |fruit|
      return nil if @pieces[fruit] > 0
    end
    :players
  end

  def get_largest_fruit
    selected = nil
    @fruits.shuffle.each do |fruit|
      this_count = @pieces[fruit]
      next if this_count <= 0
      if !selected
        selected = fruit
      elsif this_count > @pieces[selected]
        selected = fruit
      end
    end
    selected
  end

  def get_smallest_fruit
    selected = nil
    @fruits.shuffle.each do |fruit|
      this_count = @pieces[fruit]
      next if this_count <= 0
      if !selected
        selected = fruit
      elsif this_count < @pieces[selected]
        selected = fruit
      end
    end
    selected
  end

  def get_random_fruit
    has_fruit = []
    @fruits.each do |fruit|
      has_fruit << fruit if @pieces[fruit] > 0
    end
    has_fruit.sample
  end

  def use_basket_strategy_most!
    # uses fruit with the most (optimal)
    use_fruit!(get_largest_fruit)
  end

  def use_basket_strategy_random!
    # uses a random fruit
    use_fruit!(get_random_fruit)
  end

  def use_basket_strategy_least!
    # uses fruit with the least (worst)
    use_fruit!(get_smallest_fruit)
  end

  def use_basket!
    @basket_count.times do
      return if send("use_basket_strategy_#{@basket_strategy}!")
    end
  end

  def use_fruit!(rolled)
    @pieces[rolled] -= 1 if @pieces[rolled] > 0
    check_game!
  end

  def generate_random_symbol
    @die[rand(@die.length)]
  end
end