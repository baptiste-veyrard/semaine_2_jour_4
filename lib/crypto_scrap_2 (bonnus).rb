#Deuxième scrap de crypto, plus lent, mais plus fiable!

	require 'open-uri'
	require 'nokogiri'
	require 'pry'

	def connexion_page
		doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	end

	def symb_scrapper(current_id, doc)
		xpath_string = "//*[@id=\"#{current_id}\"]/td[3]"
		result_symb = doc.xpath(xpath_string)
		puts result_symb.text
		return result_symb.text
	end

	def price_scrapper(current_id, doc)
		xpath_string_2 = "//*[@id=\"#{current_id}\"]/td[5]"
		result_price = doc.xpath(xpath_string_2)
		puts result_price.text.strip
		return result_price.text.strip

	end

	def id_scrapper
		doc = connexion_page
		array_finale =[]
		doc.xpath('//tr/@id').each do |current_id|
			hash_each = Hash.new
			current_id = current_id.text
			puts current_id
			array_finale << hash_each[symb_scrapper(current_id,doc)] = price_scrapper(current_id,doc)
			puts hash_each
		end
		puts array_finale.inspect
	end


id_scrapper

