class ListsController < ApplicationController

  
	def index
		@lists = List.all
	end

	def new 
		@list = List.new
	end 

	def create 
		@list = List.new(params[:list])
		if @list.save
			flash[:notice] = "List created."
			redirect_to list_path(@list)
		else 
			flash[:error] = "Could not create list"
			redirect_to new_list_path
		end 
	end 

	def show 
		@list = List.find(params[:id])
		@task = @list.tasks.new
	end 

	def edit
		@list = List.find(params[:id])
	end 

	def update 
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:notice] = "List updated"
			redirect_to list_path(@list)
		else 
			flash[:error] = "Could not update list"
			redirect_to edit_list_path(@list)
		end 
	end 

	def destroy
    	@list = List.find(params[:id])
    	if @list.destroy
    		flash[:notice] = "List has been deleted"
    	    redirect_to :root
        else 
    	    flash[:error] = "Could not delete list"
    	    redirect_to :root
        end
    end 

end 