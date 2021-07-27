class Patient
  attr_accessor :name, :birthday, :doctor_id
  attr_writer
  attr_reader :id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
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
    result = DB.exec("INSERT INTO patients (name, birthday, doctor_id) VALUES ('#{@name}', '#{@birthday}', #{@doctor_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(patient_to_compare)
    self.name() == patient_to_compare.name()
  end

  # def albums
  #   albums = []
  #   results = DB.exec("SELECT album_id FROM albums_artists WHERE artist_id = #{@id};")
  #   results.each() do |result|
  #     album_id = result.fetch("album_id").to_i()
  #     album = DB.exec("SELECT * FROM albums WHERE id = #{album_id};")
  #     name = album.first().fetch("name")
  #     albums.push(Album.new({:name => name, :id => album_id}))
  #   end
  #   albums
  # end

  # def update(attributes)
  #   if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
  #     @name = attributes.fetch(:name)
  #     DB.exec("UPDATE patients SET name = '#{@name}' WHERE id = #{@id};")
  #   elsif (attributes.has_key?(:doctor_name)) && (attributes.fetch(:doctor_name) != nil)
  #     doctor_name = attributes.fetch(:doctor_name)
  #     doctor = DB.exec("SELECT * FROM doctors WHERE lower(name)='#{doctor_name.downcase}';").first
  #     if doctor != nil
  #       DB.exec("INSERT INTO patients (doctor_id) VALUES (#{doctor['id'].to_i}, #{@id});")
  #     end
  #   end
  # end

  def update(attributes)
    @name = name
    @doctor_id = doctor_id
    DB.exec("UPDATE patients SET name = '#{@name}', doctor_id = #{@doctor_id} WHERE id = #{@id};")
  end
end