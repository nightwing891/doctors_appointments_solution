class AppointmentsController < ApplicationController
  before_action :set_doc
  before_action :set_appoint, only: [:show, :edit, :update, :destroy]
  def index
    @stranges = @dr.appointments.where(speciality: 'strange')
    @peds = @dr.appointments.where(speciality: 'pediatrics')
    @fams = @dr.appointments.where(speciality: 'family medicine')
  end

  def show
  end

  def new
    @appointment = @dr.appointments.new
  end

  def create
    @appointment = @dr.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@dr)
    else
      render :new
    end
  end

  def edit  
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_appointments_path(@dr)
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to doctor_appointments_path(@dr)
  end

  private
    def set_appoint
      @appointment = @dr.appointments.find(params[:id])
    end

    def set_doc
      @dr = Doctor.find(params[:doctor_id])
    end

    def appointment_params
      params.require(:appointment).permit(:speciality, :doctor_id, :time)
    end
end
