require 'spec_helper'

describe '#Doctor' do

  describe('.all') do
    it("returns an empty array when there are no doctors") do
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a doctor") do
      doctor = Doctor.new({:name => "Richmond", :id => nil, :specialty => "cancer"})
      doctor.save()
      doctor2 = Doctor.new({:name => "Who", :id => nil, :specialty => "blood"})
      doctor2.save()
      expect(Doctor.all).to(eq([doctor, doctor2]))
    end
  end
end