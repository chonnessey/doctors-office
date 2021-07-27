class Patient
  attr_accessor :name, :birthday
  attr_writer
  attr_reader :id, :doctor_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)
  end

end