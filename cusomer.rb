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
    total_amount, frequent_renter_points = 0, 0
    result = "Rental Recode for #{@name}"
    @rentals.each do |element|
      #レンタルポイントの加算
      frequent_renter_points += element.frequent_renter_points
      #このレンタルの料金の表示
      result += element.movie.title + element.charge.to_s
      total_amount += element.charge
    end
    #フッターの追加
    result += "Amount owed is #{total_amount}\n"
    result += "you earned #{frequent_renter_points} frequent renter points"
    result
  end
end
