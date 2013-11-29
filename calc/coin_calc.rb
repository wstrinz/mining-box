require 'open-uri'
require 'json'
require 'openssl'
require 'csv'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

def xpm_revenue(xpm_per_hour = 0.15, btc_to_usd = nil, xpm_to_btc = nil)
	btc_to_usd = JSON.parse(open('https://mtgox.com/api/1/BTCUSD/ticker').read)["return"]["last"]["value"].to_f unless btc_to_usd
	xpm_to_btc = JSON.parse(open("https://btc-e.com/api/2/xpm_btc/ticker").read)["ticker"]["last"] unless xpm_to_btc

  #payments = CSV.parse(open('http://xpm.syware.de/?a=AdgLUAL6hK3kcZ2vftygzMj5Xwjeor5f17').read()[/Block\tDate.*/m].gsub("PAID!",""), col_sep: "\t")
  #puts payments[1..-1].map{|p| p[3].to_f}.inject(:+)

  #xpm_per_hour = ARGV[0].to_f ||= 0.15

	dollars_per_mo = xpm_per_hour * 24 * 365 / 12 * xpm_to_btc * btc_to_usd
end

puts xpm_revenue(*ARGV.map(&:to_f))
