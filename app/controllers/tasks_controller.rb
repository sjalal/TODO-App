class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @task = Task.new
    end 

    def create 
    	@task = Task.create( params[:task] )
    	flash[:notice] = "Your post has now been published!"
    	redirect_to :root
    end 

end
