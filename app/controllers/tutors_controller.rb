class TutorsController < ApplicationController
  before_action :user_authentication, only: [:new,:create]

  before_action :set_tutor, only: [:show, :edit, :update, :destroy, :changeState]

  # GET /tutors
  # GET /tutors.json
  def search
    subject_id=params[:subject]
    region=params[:tags]

    point=Geocoder.coordinates(region)

    # near method is from Geocoder to find out the near by object, 20 is the radius from center point
    @tutors=Subject.find(subject_id).tutors.near(point, 50, :units => :km).paginate(:page => params[:page]).order('updated_at DESC')

    @hash = Gmaps4rails.build_markers(@tutors) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end


    render :index


  end


  def index
    # @tutors = Tutor.where(aasm_state: :published)
    @tutors = Tutor.paginate(:page => params[:page]).order('updated_at DESC')
    @hash = Gmaps4rails.build_markers(@tutors) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

  end

  # GET /tutors/1
  # GET /tutors/1.json
  def show
    @hash = Gmaps4rails.build_markers(@tutor) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

    @event=Event.new
    @comments=Comment.where(tutor: @tutor)
    @subjects=@tutor.subjects

    if @comments.any?
      @avgRate=averageRate
      # @rateArr=['50%','40%','30%','20%','10%']
      @rateArr=getRateArray
    else
      @avgRate=0
      @rateArr=['0%','0%','0%','0%','0%']
    end

  end


  # GET /tutors/new
  def new
    @tutor = Tutor.new
  end

  # GET /tutors/1/edit
  def edit
  end

  # POST /tutors
  # POST /tutors.json
  def create


    # id=params.require(:tutor).permit(subject_ids:[])

    @tutor = Tutor.new(tutor_params)

    @user=current_user

    @tutor.user=@user


    point=Geocoder.coordinates(@tutor.address)
    if point
      @tutor.latitude=point[0]
      @tutor.longitude=point[1]
    end


    respond_to do |format|
      if @tutor.save

        if user_sign_in?
          user=current_user
          user.is_tutor=true
          user.save
        end

        format.html { redirect_to @tutor, notice: 'Tutor was successfully created.' }
        format.json { render :show, status: :created, location: @tutor }
      else
        format.html { render :new }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutors/1
  # PATCH/PUT /tutors/1.json
  def update
    respond_to do |format|
      if @tutor.update(tutor_params)
        format.html { redirect_to @tutor, notice: 'Tutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor }
      else
        format.html { render :edit }
        format.json { render json: @tutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.json
  def destroy
    @tutor.destroy
    respond_to do |format|
      format.html { redirect_to tutors_url, notice: 'Tutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def changeState

    if @tutor.draft?
      @tutor.publish
      @tutor.save
    else
      @tutor.unpublish
      @tutor.save
    end
    redirect_to tutor_path(@tutor)

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tutor
    @tutor = Tutor.find(params[:id]) if params[:id]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tutor_params

    params.require(:tutor).permit(:degree, :low_price, :high_price, :cellphone, :image, :description, :address, :region_id, subject_ids: [])

  end

  def averageRate
    comments=@tutor.comments
    sum=0
    comments.each do |comment|
      sum+=comment.rate

    end

    sum/comments.length

  end

  def getRateArray
    total=@comments.length
    arr=[]


    arr.push(percentage(@comments.where(rate: 5).length,total))
    arr.push(percentage(@comments.where(rate: 4).length,total))
    arr.push(percentage(@comments.where(rate: 3).length,total))
    arr.push(percentage(@comments.where(rate: 2).length,total))
    arr.push(percentage(@comments.where(rate: 1).length,total))


    arr
  end

  def percentage(num,total)
    new_num=num.to_f/total*100
    new_num.to_s+'%'

  end
end
