require 'nokogiri'
require 'open-uri'

begin
    cryptopage = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    deputes_fiches = cryptopage.xpath('//a[contains(@href, "fiche")]/@href').map(&:text)

rescue => exception
    puts "Adresse invalide."
end

array_buddies = []

for i in 0..deputes_fiches.length-1
    begin
        temp_link = Nokogiri::HTML(URI.open("https://www2.assemblee-nationale.fr"+deputes_fiches[i]))
        temp_mail = temp_link.xpath('//a/span[contains(text(), "@assemblee-nationale.fr")]').map(&:text)
        name = temp_link.xpath('//a/h1[contains(@class, "h1 _mt-small")]').map(&:text)
        name = name[0].split

        #On stock tout dans un array de hash
        array_buddies[i] = {"first_name" => name[1], "last_name" => name[2], "email" => temp_mail}
        #On put en temps réel car vous aurez la flemme d'attendre jusqu'au bout :-)
        puts "Prénom : "+ name[1] + " | Nom : " + name[2] + " | Email : " + temp_mail.to_s.tr('["]', '')


    rescue => exception
         puts "Adresse mail non trouvée."
    end
end