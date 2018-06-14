class RecipeCard

  attr_accessor :user, :date, :rating, :recipe

  @@all = []

  def initialize(attributes)
    attributes.each do |k, v|
      if self.respond_to?("#{k}=")
        self.send("#{k}=", v)
      end
    end

    @@all << self
  end

  def self.all
    @@all
  end

end
