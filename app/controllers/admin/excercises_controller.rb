class Admin::ExcercisesController < Admin::BaseController

  before_action :load_excercise, only: [:show, :edit, :destroy]
<<<<<<< HEAD
  before_action :load_lesson, only: [:create, :new, :show, :edit, :destroy]

  def index; end
=======
  # before_action :load_course, only: [:new, :create, :destroy]

  def show; end
>>>>>>> ba1a6aa... tao excercise

  def new
    @excercise = @lesson.excercises.build
  end

  def create
<<<<<<< HEAD
    @excercise = @lesson.excercises.build excercise_params
    if @excercise.save
      flash[:success] = "Tạo bài tập thành công!"
      redirect_to admin_sname_lesson @lesson
=======
    @excercise = @lesson.excercises.build excerise_params
    if @excercise.save
      flash[:success] = "Tạo bài tập thành công!"
      redirect_to new_admin_sname_lesson_excercise_path @lesson
>>>>>>> ba1a6aa... tao excercise
    else
      flash[:danger] = "Bạn chưa điền đầy đủ thông tin bài tập"
      render :new
    end
  end

  def edit; end

  def update
<<<<<<< HEAD
    @lesson = @excercise.lesson
=======
>>>>>>> ba1a6aa... tao excercise
    if @excercise.update_attributes excercise_params
      flash[:success] = "Cập nhật bài tập thành công!"
      redirect_to admin_lesson_path @lesson
    else
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD
    @excercise.destroy
=======
    @lesson.destroy
>>>>>>> ba1a6aa... tao excercise
    flash[:danger] = "Xóa bài tập thành công!"
    redirect_to admin_lesson_path @excercise.lesson
  end

  private
  def excercise_params
<<<<<<< HEAD
    params.require(:excercise).permit :excercise_name
  end

  def load_lesson
    @lesson = Lesson.find_by id: params[:lesson_id]
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:id]
  end
 end
=======
    params.require(:excercise).permit :excercise_tittle, :questions,
      :answers
  end

  def load_excercise
    @excercise = Excercise.find_by id: params[:excercise_id]
  end

  # def load_lesson
  #   @lesson = Lesson.find_by id: params[:id]
  # end
end
>>>>>>> ba1a6aa... tao excercise
