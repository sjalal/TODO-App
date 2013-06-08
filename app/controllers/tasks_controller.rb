class TasksController < ApplicationController
    def index
        @tasks = Task.all
        @task = Task.new
    end 

    def create 
    	Task.create params[:task] 
    	flash[:notice] = "You have successfully added a task !"
    	redirect_to :root
    end 
    
    def edit 
    	@task = Task.find params[:id]
    end 

    def update 
    	task = Task.find params[:id]
    	if task.update_attributes params[:task]
    		redirect_to task_path, :notice => 'Your task has successfully been updated.'
    	else 
    		redirect_to :root, :notice => 'There was an error updating your task.'
    	end 
    end 
    
    def destroy
    	Task.destroy params[:id]
    	redirect_to :root, :notice => 'Task has been deleted.'
    end 
end

