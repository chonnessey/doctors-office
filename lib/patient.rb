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
    returned_patients.each() do |doctor|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      dob = patient.fetch("dob")
      doctor_id = patient.fetch("doctor_id").to_i
      patients.push(Patient.new({:name => name, :id => id, :dob => dob, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    result = DB.exec("INSERT INTO patients (name, dob, doctor_id) VALUES ('#{@name}', '#{dob}',  #{@doctor_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end