#encoding: utf-8
class FichaArtisticasController < ApplicationController
  before_action :signed_in_user, only: [:show, :new, :edit, :create, :update, :destroy]
  before_action :inicializar_variables, only: [:new, :edit]

  def show
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @ficha = FichaArtistica.find(params[:id])
  end

  def new
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @ficha = FichaArtistica.new(params[:id])
  end

  def index
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @integrantes = []
    @fichas = @formulario.datos_esp.ficha_artisticas
    @integrantes = [@fichas]
  end

  def edit
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @ficha = FichaArtistica.find(params[:id])
  end

  def create
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @ficha = FichaArtistica.new(ficha_artistica_params)
    if @formulario.datos_esp.ficha_artisticas << @ficha
      flash[:success] = "Se ha creado una ficha correctamente"
      redirect_to formulario_ficha_artisticas_path
    else
      inicializar_variables
      render 'new'
    end
  end

  def update
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @ficha = FichaArtistica.find(params[:id])
    if @ficha.update(ficha_artistica_params)
      flash[:success] = "Se ha actualizado una ficha correctamente"
      redirect_to formulario_ficha_artisticas_path
    else
      inicializar_variables
      render 'edit'
    end
  end

  def destroy
    @formulario = Formulario.find_by_id(params[:formulario_id])
    @formulario.datos_esp.ficha_artisticas.destroy(params[:id])
    if @formulario.datos_esp.save
      flash[:success] = "Se ha eliminado una ficha correctamente"
      redirect_to formulario_ficha_artisticas_path
    else
      flash.now[:failure] = "La ficha no pudo ser eliminado"
      render 'index'
    end
  end

  private

  def ficha_artistica_params
    params.require(:ficha_artistica).permit(:rol_artista, :nombre_artista, :apellido_artista)
  end

  def inicializar_variables
  end
end