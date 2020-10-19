require 'pry'
require 'csv'
class Gossip
    attr_accessor :auteur, :contenu

    def initialize(auteur, contenu)
        @auteur = auteur
        @contenu = contenu
        
    end
#cette fonction permet de sauvegarder les gossips dans la base de données en CSV
    def save
        CSV.open("/Users/RaphaelledeLaBouillerie/THP/Day_18/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
          csv << [@auteur, @contenu]
        end
    end
#cette fonction permet de concentrer l'ensemble des gossips dans un array. 
    def self.all
        @all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
        @all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return @all_gossips
    end
#cette fonction permet de chercher un gossip grâce à son id. 
    def self.find(id)
		all_gossips = self.all
		all_gossips[id]
	end 
end

