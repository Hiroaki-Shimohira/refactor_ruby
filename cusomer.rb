class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "Rental Recode for #{@name}"
    @rentals.each do |element|
      #このレンタルの料金の表示
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end
    #フッターの追加
    result += "Amount owed is #{total_amount}\n"
    result += "you earned #{total_frequent_rental_points} frequent renter points"
    result
  end

  private
  #料金の計算
  def total_charge
    @rentals.inject(0) {|sum, rental| sum + rental.charge}
  end
  #レンタルポイントの加算
  def total_frequent_rental_points
    @rentals.inject(0) {|sum, rental| sum + rental.frequent_renter_points}
  end
end







