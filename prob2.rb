require 'httparty'
require 'json'

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")

if response.code == 200
  crypto_data = JSON.parse(response.body)

  sorted_data = crypto_data.sort_by { |crypto| -crypto['market_cap'] }

  puts "Top 5 Cryptocurrencies by Market Capitalization:"
  sorted_data.first(5).each_with_index do |crypto, index|
    puts "#{index + 1}. #{crypto['name']} - Price: $#{crypto['current_price']} - Market Cap: $#{crypto['market_cap']}"
  end
else
  puts "Couldn't get crypto data from CoinGecko"
end
