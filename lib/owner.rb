class Owner
    attr_reader :name, :species
    @@all = []

    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
    end

    def say_species
      "I am a #{@species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.count
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def buy_cat(name)
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def walk_dogs
      self.dogs.each do |dog|
        dog.mood = "happy"
      end
    end

    def feed_cats
      self.cats.each do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets 
      self.dogs.each {|dog| 
        dog.mood = "nervous"
        dog.owner = nil
      }
      self.cats.each {|cat| 
        cat.mood = "nervous"
        cat.owner = nil
      }
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.dogs.count} cat(s)."
    end

end