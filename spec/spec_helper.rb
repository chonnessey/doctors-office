require 'rspec'
require 'pg'
require 'doctor'
require 'patient'
require 'pry'

DB = PG.connect({dbname: 'clinic_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    # DB.exec("DELETE FROM albums_artists *;")
  end
end