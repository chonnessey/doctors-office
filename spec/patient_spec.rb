require 'spec_helper'

describe '#Patient' do

before(:each)do 
  @doctor = Doctor.new({:name => "Fluffy", :specialty => "whiskers", :id=> nil})
  @doctor.save()
end 

  describe('.all') do
    it("returns an empty array when there are no patients") do
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a doctor") do
      patient = Patient.new({:name => "Richmond", :id => nil, :birthday => "1992-02-07", :doctor_id => @doctor.id})
      patient.save()
      patient2 = Patient.new({:name => "Dave", :id => nil, :birthday => "1990-09-03", :doctor_id => @doctor.id})
      patient2.save()
      expect(Patient.all).to(eq([patient, patient2]))
    end
  end

  describe('#update') do
    it("updates patient's doctor") do
      patient = Patient.new({:name => "Richmond", :id => nil, :birthday => "1992-02-07", :doctor_id => @doctor.id})
      patient.save()
      # doctor = Doctor.new({:name => "Richmond", :id => nil, :specialty => "cancer"})
      patient.update({:name => patient.name, :doctor_id => @doctor.id})
      expect(patient.doctor_id).to(eq(@doctor.id))
    end
  end
end