	require 'open-uri'
	require 'nokogiri'
	require 'pry'


	def connexion_page
		doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	end


	def id_scrapper
		doc = connexion_page

		#J'initialise mes arrays
		array_symb = []
		array_price = []

		#Je rempli mon array_symp avec tous les symboles
		doc.xpath("//td[3]").each do |symb|
			array_symb << symb.text.strip
		end

		#Je rempli mon array_price avec tous les prix
		doc.xpath("//td[5]").each do |price|
			array_price << price.text.strip
		end

		#J'initialise ma crypto_array qui sera mon array finale
		crypto_array = []

		#Je rempli ma crypto_array avec des hashs(qui sont remplis avec mes deux précédentes array)
		array_symb.count.times do |index|
			crypto_array << {array_symb[index] => array_price[index]}
		end  

		#J'affiche et return mon Array
		puts crypto_array.inspect
		return crypto_array
	end

	id_scrapper

