class FathersController < ApplicationController
  def index
    @fathers = Father.all
  end

  def new
    @father = Father.new
    @father.sons.build
    @father.sons.build
  end

  def create
    @father = Father.new(father_params)
    
    if @father.save
      redirect_to fathers_path
    else
      render :new
    end
  end

  def edit
    @father = Father.find(params[:id])
    @father.build_sons_up_to(2)
  end

  def update
    @father = Father.find(params[:id])
    
    if @father.update(father_params)
      redirect_to fathers_path
    else
      render :edit
    end
  end
  
  def destroy
    @father = Father.destroy(params[:id])
    @father.destroy
    
    redirect_to fathers_path
  end
  
  private
    
    def father_params
      params[:father].permit(:name, sons_attributes: [:id, :name, :_destroy])
    end
end
