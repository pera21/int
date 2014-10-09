#encoding: utf-8
require 'spec_helper'

describe Principal do

  let(:provincia) { FactoryGirl.build(:provincia) }
  let(:localidad) { FactoryGirl.build(:localidad) }
  let(:grupo) { FactoryGirl.build(:grupo) }
  let(:condicion) { FactoryGirl.build(:condicion) }
  let(:registro) { FactoryGirl.build(:registro) }
  let(:formulario) { FactoryGirl.build(:formulario) }

  before do
    @principal = formulario.build_principal(provincia: provincia, localidad: localidad, grupo: grupo,
                                            nombre: "Los gauchitos", registro: registro)
    @principal.condiciones << condicion
  end

  subject { @principal }

  it { should respond_to(:nombre) }
  it { should respond_to(:provincia) }
  it { should respond_to(:localidad) }
  it { should respond_to(:grupo) }
  it { should respond_to(:registro) }
  it { 
    formulario.save!
    should be_valid 
  }

  describe "validations" do

    before {@principal.nombre = ' '}
    it {should_not be_valid}

    it "should have the right associated provincia" do
      @principal.provincia_id.should == provincia.id
    end

    it "should have the right associated localidad" do
      @principal.localidad_id.should == localidad.id
    end

    it "should have the right associated grupo" do
      @principal.grupo_id.should == grupo.id
    end


    describe "when provincia_id is not present" do
      before do
        @principal.provincia = nil
      end
      it { should_not be_valid }
    end

    describe "when localidad_id is not present" do
      before do
        @principal.localidad = nil
      end
      it { should_not be_valid }
    end

    describe "when grupo_id is not present" do
      before do
        @principal.grupo = nil
      end
      it { should_not be_valid }
    end

    describe "when condicion_id is not present" do
      before do
        @principal.condiciones = []
      end
      it { should_not be_valid }
    end

    describe "when nombre is not present" do
      before do
        @principal = Principal.new(formulario_id: 1, provincia: provincia, localidad: localidad, grupo: grupo,
                                   nombre: " ", registro: registro)
        @principal.condiciones << condicion
      end
      it { should_not be_valid }
    end

    describe "when nombre is too long" do
      before { @principal.nombre = "a" * 71 }
      it { should_not be_valid }
    end
  end

  describe "relacion con principal" do
    it { should respond_to(:condiciones) }

    it  {
      @principal.condiciones = []
      @principal.condiciones << condicion
      formulario.save!
      @principal.condiciones.first.id.should == condicion.id
    }

    it  {
      @principal.condiciones = []
      @principal.condiciones << condicion
      formulario.save!
      @principal.save!
      @principal.reload
      @principal.condiciones.first.principals.first.id.should == @principal.id
    }
  end

end
