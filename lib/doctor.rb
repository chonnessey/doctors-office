class Doctor
  attr_accessor :name, :specialty
  attr_writer
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

end