
require 'csv'


class Gossip 
attr_accessor :author, :content, :gossips

	def initialize (author, content)
		@author = author 
		@content = content
	end

	def save
    CSV.open("/Users/chandara/Desktop/Fullstack/Sinatra/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
  	gossips = []
  	CSV.read("/Users/chandara/Desktop/Fullstack/Sinatra/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
   		gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  	return gossips
	end

	def self.find(id)
		gossips_arr = Gossip.all
	return gossips_arr[(id.to_i - 1)]
	end 

end 


