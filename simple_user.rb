class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    ## "#{@name} <#{@email}>"
	"#{self.name} #{self.email}"
  end
end

## User.new( {name: "Valaki", email: "valaki.huhu"})
## ha egy fgv utolso parameter egy hash akkor nem muszaj kirakni a hash jelet
user = User.new( name: "Valaki", email: "valaki.huhu")
puts user.formatted_email
