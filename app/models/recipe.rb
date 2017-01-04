class Recipe
    include HTTParty
    ENV["FOOD2FORK_KEY"] = "5b6b74c6cc0fa9dc23871a7ae753f6c7"
    hostport = ENV['FOOD2FORK_SERVER_AND_PORT']||'www.food2fork.com'
    base_uri "http://#{hostport}/api" #Same across most requests 
    default_params key: ENV["FOOD2FORK_KEY"] #defaults, like API developer key #fields: "image_url, source_url, title",
    format :json #Tell it which format data comes in
    #q:"search" request parameter 

    def self.for (keyword) 
    	#class method called for which takes in a term 
    	get("/search", query: {q: keyword})["recipes"]  #get is method provided by HTTParty 

        #elements is the key of the hash from coursera documentation
        #returns array where each element in the array is a hash 
	end 
end