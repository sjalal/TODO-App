class TasksController < ApplicationController
    
    before_filter :find_list
    

    def create 

        @task = @list.tasks.new(params[:task])
        if @task.save
            flash[:notice] = "Task created"
            redirect_to list_url(@list)
        else 
            flash[:error] = "Could not add task at this time"
            redirect_to list_url(@list)
        end 
    end 

    def destroy
        @task = @List.tasks.find(params[:id])
        if @task.destroy
           flash[:notice] = 'Task has been deleted.'
        else 
           flash[:error] = "Could not delete the task"
        end
    end

    def find_list
        @list = List.find(params[:list_id])
    end 
    

    # def index
    #     @tasks = Task.all
    #     @task = Task.new
    # end 

    # def create 
    # 	Task.create params[:task] 
    # 	flash[:notice] = "You have successfully added a task !"
    # 	redirect_to :root
    # end 
    
    # def edit 
    # 	@task = Task.find params[:id]
    # end 

    # def update 
    # 	task = Task.find params[:id]
    # 	if task.update_attributes params[:task]
    # 		redirect_to task_path, :notice => 'Your task has successfully been updated.'
    # 	else 
    # 		redirect_to :root, :notice => 'There was an error updating your task.'
    # 	end 
    # end 
    
    # def destroy
    # 	Task.destroy params[:id]
    # 	redirect_to :root, :notice => 'Task has been deleted.'
    # end 
end

