class UnitsController < ApplicationController
  before_action :set_unit, only: %i[ show edit update destroy ]

  # GET /units or /units.json
  def index
    @course = Course.find_by(id: params[:course_id])
    @units = @course.units
  end

  # GET /units/1 or /units/1.json
  def show
  end

  # GET /units/new
  def new
    @course = Course.find(params[:course_id])
    @unit = @course.units.build
  end

  # GET /units/1/edit
  def edit
    @course = Course.find(params[:course_id])
  end

  # POST /units or /units.json
  def create
    @course = Course.find(params[:course_id])
    @unit = @course.units.build(unit_params)

    respond_to do |format|
      # if @course.units << @unit
      if @unit.save
        format.html { redirect_to edit_course_path(@course), notice: "Unit was successfully created." }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1 or /units/1.json
  def update
    @course = Course.find(params[:course_id])
    
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to edit_course_path(@course), notice: "Unit was successfully updated." }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1 or /units/1.json
  def destroy
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to _units_url, notice: "Unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_params
      params.require(:unit).permit(
        :name,
        :position,
        :body
      )
    end
end
