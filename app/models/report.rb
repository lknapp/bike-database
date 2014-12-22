class Report

  @@years = Bike.all.each.map{|bike| Time.parse(bike.date_sold).year if bike.date_sold}

  def self.bikes_sold_per_year
    counts = Hash.new(0)
    @@years.each { |year| counts[year] += 1 }
    counts
  end

  def self.average_price_per_year
    prices = Bike.all.each.map{|bike| bike.price}
    years_prices = @@years.each_with_index.map{|year, index| {prices[index].to_s.to_sym => year}}
    merged_years_prices = years_prices.reduce({}, :merge)
    years_prices_grouped = merged_years_prices.group_by{|k, v| v}
    
    average_price_array = years_prices_grouped.each.map{ |k, year_values|
      year_prices = year_values.each.map{|pair| pair[0]}
      float_prices = year_prices.map{|price| price.to_s.to_f}
      average_price = float_prices.inject{ |sum, el| el + sum } / float_prices.size
      {k => average_price}
    }
    average_prices = average_price_array.reduce({}, :merge)
  end

  def self.yearly_data
    unique_years = @@years.uniq
    bikes_sold_per_year = Report.bikes_sold_per_year()
    average_price_per_year = Report.average_price_per_year()
    yearly_data_array = unique_years.map{|year| {year => {number: bikes_sold_per_year[year], average_price: average_price_per_year[year]}}}
    yearly_data = yearly_data_array.reduce({}, :merge)
    Hash[yearly_data.sort]
  end

end
