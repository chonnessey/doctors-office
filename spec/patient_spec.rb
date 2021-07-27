require 'spec_helper'

describe '#Patient' do

  describe('.all') do
    it("returns an empty array when there are no patients") do
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a doctor") do
      patient = Patient.new({:name => "Richmond", :id => nil, :birthday => "1992-02-07", :doctor_id => nil})
      patient.save()
      patient2 = Patient.new({:name => "Dave", :id => nil, :birthday => "1990-09-03", :doctor_id => nil})
      patient2.save()
      expect(Patient.all).to(eq([patient, patient2]))
    end
  end
end