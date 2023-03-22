class MunicipesController < ApplicationController
  layout 'application'

  before_action :set_municipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    if params[:filtro].present?
      @municipes = Municipe.where("#{params[:filtro]} = ?", params[:valor_filtro]).paginate(page: params[:page],
                                                                                            per_page: 10)
    elsif params[:filtro_endereco].present?
      @municipes = Municipe.joins(:addresses).where("addresses.#{params[:filtro_endereco]} = ?", params[:valor_filtro_endereco])
      .paginate(page: params[:page], per_page: 10)
    else
      @municipes = Municipe.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @municipe = Municipe.find(params[:id])
  end

  def new
    @municipe = Municipe.new
  end

  def edit; end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to new_addresses_path(municipe_id: @municipe.id), notice: 'O Munícipe foi criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @municipe.update(municipe_params)
      redirect_to municipe_url(@municipe), notice: 'O Munícipe foi atualizado com sucesso!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :birthdate, :phone, :photo, :status)
  end
end
