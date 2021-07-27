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

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      birthday = patient.fetch("birthday")
      doctor_id = patient.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :id => id, :birthday => birthday, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@dob}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(patient_to_compare)
    self.name() == patient_to_compare.name()
  end

end