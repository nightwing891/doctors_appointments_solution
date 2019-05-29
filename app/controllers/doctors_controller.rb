class DoctorsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  def index
    @drs = Doctor.all
  end

  def show
  end

  def new
    @dr = Doctor.new
  end

  def create
    @dr = Doctor.new(dr_params)

    if @dr.save
      redirect_to @dr
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dr.update(dr_params)
      redirect_to @dr
    else
      render :edit
    end
  end

  def destroy
    @dr.destroy
    redirect_to drs_path
  end

  private
    def set_doc
      @dr = Doctor.find(params[:id])
    end

    def dr_params
      params.require(:doctor).permit(:first_name, :last_name)
    end
end
