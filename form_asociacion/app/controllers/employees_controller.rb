class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :edit, :update, :destroy]
  def index
    @employee = Employee.all
  end

  def show
  end

	def new
    @employee = Employee.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end


	def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee.company, notice: 'employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
       	format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to @employee.category, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	private
		def set_employee
      @employee = Employee.find(params[:id])
    end
		def employee_params
			params.require(:employee).permit(:first_name, :last_name, :email)
		end
end
