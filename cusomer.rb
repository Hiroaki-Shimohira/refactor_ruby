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
      frequent_renter_points += 1
      #新作を借りた場合のレンタルポイントの追加
      if element.movie.price_code = Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end
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
