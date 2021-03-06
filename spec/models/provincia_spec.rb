#encoding: utf-8
require 'spec_helper'

describe Provincia do

  before do
    @region = Region.create(codigo: "a",detalle: "Cuyo")
    @provincia = @region.provincias.build(codigo: "aa", detalle: "Buenos Aires")
  end

  subject { @provincia }

  it { should respond_to(:codigo) }
  it { should respond_to(:detalle) }
  it { should respond_to(:region) }
  it { should respond_to(:localidades) }

  it {should be_valid}

  describe "validations" do

    describe "cuando codigo es nulo" do
      before {@provincia.codigo = " "}
      it {should_not be_valid}
    end

    describe "cuando detalle es nulo" do
      before {@provincia.detalle = " "}
      it {should_not be_valid}
    end

    it "should have the right associated region" do
      @provincia.region_id.should == @region.id
    end

    describe "when region_id is not present" do
      before do
        @provincia = Provincia.new(region_id: " ", detalle: "Buenos Aires")
      end
      it { should_not be_valid }
    end

    describe "when detalle is not present" do
      before do
        @provincia = Provincia.new(region_id: @region.id, detalle: " ")
      end
      it { should_not be_valid }
    end

    describe "when detalle is too long" do
      before { @provincia.detalle = "a" * 71 }
      it { should_not be_valid }
    end
  end
end
