# Subjects Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::SubjectsController < AdminController
  # before action
  before_action :set_subject, only: %i[show edit update destroy]

  # GET admin/subjects
  # GET admin/subjects.json
  def index
    @subjects = Subject.all.order(:name)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show; end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit; end

   # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        format.html { redirect_to admin_subject_path(@subject), success: I18n.t('subject.success') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to admin_subject_path(@subject), success: I18n.t('subject.edited') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/subjects', success: I18n.t('subject.deleted') }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, employee_ids: [])
  end
end
