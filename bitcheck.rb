def bitcheck(num=1000)
require 'rest-client'
require 'nokogiri'


if num.class == Fixnum or num.class == Bignum
puts "started .......................................... "
g=0
i=0
page=num
fname = "bitcheck.txt"
filename = "coinwithbalance.txt"
limit = 904625697166532776746648320380374280100293470930272690489102837043110636675
puts     "checking from "+page.to_s + " to " + limit.to_s
while page < limit 
load = RestClient.get('http://directory.io/'+page.to_s)
noko = Nokogiri::HTML(load)
element = noko.css('lol')
m=0

while m < element.count
c=element[m].text.split(" ")
if c[4] == "true"
bal=0.0
g+=1
b = RestClient.get("https://blockchain.info/q/addressbalance/"+c[2]+"?confirmations=3")
bal = b.body.to_f/100000000
if bal > 0.0001
cwb = File.open(filename, "a")
cwb.puts g.to_s + c.to_s + " page #{page} "+ " line #{ m/2 } " + " Balance " + bal.to_s
cwb.close
5.times {puts "YAY YAY YAY found with balance ALLLAHU AKBAR "}
end
file=File.open(fname, "a")
file.puts g.to_s + c.to_s + " page #{page} "+ " line #{ m/2 } " + " Balance " + bal.to_s
file.close
puts c
end 
m+=2
end
page+=1
puts "CURRENT PAGE "+" " +page.to_s
end 


else 
puts "Enter number only "
puts "Program will abort now"
end
puts "Ending Program ................."
end