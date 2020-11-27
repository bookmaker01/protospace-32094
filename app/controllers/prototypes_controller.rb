class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @prototype = Prototype.includes(:user)
  end

  def new
    
    @prototype = Prototype.new
    #  render partial: "form" 
    
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
     end

    def show
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
      @prototype = Prototype.find(params[:id])
    end

    def edit
    end

    def update
      if current_user.update(user_params)
        redirect_to root_path
      else
        render :edit
      end
      prototype = Prototype.find(params[:id])
      prototype.update(prototype_params)
    end

    def destroy
      if @prototype.destroy
        redirect_to root_path
      else
        redirect_to root_path
      end
    end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end

