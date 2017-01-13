class CoursesMenusController < ApplicationController
  before_action :set_courses_menu, only: [:show, :edit, :update, :destroy]

  # GET /courses_menus
  # GET /courses_menus.json
  def index
    @courses_menus = CoursesMenu.all
  end

  # GET /courses_menus/1
  # GET /courses_menus/1.json
  def show
  end

  # GET /courses_menus/new
  def new
    @courses_menu = CoursesMenu.new
  end

  # GET /courses_menus/1/edit
  def edit
  end

  # POST /courses_menus
  # POST /courses_menus.json
  def create
    @courses_menu = CoursesMenu.new(courses_menu_params)

    respond_to do |format|
      if @courses_menu.save
        format.html { redirect_to @courses_menu, notice: 'Courses menu was successfully created.' }
        format.json { render :show, status: :created, location: @courses_menu }
      else
        format.html { render :new }
        format.json { render json: @courses_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses_menus/1
  # PATCH/PUT /courses_menus/1.json
  def update
    respond_to do |format|
      if @courses_menu.update(courses_menu_params)
        format.html { redirect_to @courses_menu, notice: 'Courses menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @courses_menu }
      else
        format.html { render :edit }
        format.json { render json: @courses_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses_menus/1
  # DELETE /courses_menus/1.json
  def destroy
    @courses_menu.destroy
    respond_to do |format|
      format.html { redirect_to courses_menus_url, notice: 'Courses menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses_menu
      @courses_menu = CoursesMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def courses_menu_params
      params.require(:courses_menu).permit(:course_name, :day, :menu_id)
    end
end
