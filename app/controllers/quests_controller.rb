class QuestsController < ApplicationController
	before_action :find_quest, only: [:show, :edit, :update, :destroy]
  before_action :authentication_check, only: [:index, :show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:taskpanelshow]
  
  def index
  	@quests = Quest.all.order("created_at ASC")
  end
  def new
  	@quest = Quest.new
  end

  def create
  	@quest = Quest.new(quest_params)
  	if @quest.save
  		redirect_to @quest
  	else
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @quest.update(quest_params)
  		redirect_to @quest
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@quest.destroy
  	redirect_to root_path
  end

  def taskpanelshow
 #   UserId = current_user.id
 #   getir = userquests.joins(:user).where(users{id:UserId} ).order("expiredate ASC").take(3)
 #   if(getir!=null)
 #     if(Time.now<= getir.expiredate)
 #       @quest=getir
 #     else
 #       rand_record = Quest.order("RANDOM()").take(3)
 #       rand_record.each do |quest|
 #         current_user.quests << snickers db.execute( "INSERT INTO userquests ( questid, Name ) VALUES ( #{id}, '#{name}' )" )
 #   end /

    rand_record = Quest.order("RANDOM()").take(3)
    @quests = rand_record
  end

  private
	def find_quest
		@quest = Quest.find(params[:id])
	end
  def authentication_check
    if current_user.try(:admin?)
    else
      redirect_to root_path
    end
  end
	def quest_params
		params.require(:quest).permit(:title, :content, :exp)
	end
end
