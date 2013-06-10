class TasksController < ApplicationController
    
    before_filter :find_list
    
    def create 
        @task = @list.tasks.new(params[:task])
        if @task.save
            flash[:notice] = "Task created"
            redirect_to list_path(@list)
        else 
            flash[:error] = "Could not add task at this time"
            redirect_to list_path(@list)
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
end

