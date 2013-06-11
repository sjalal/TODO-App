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

    def complete 
        @task = @list.tasks.find(params[:id])
        @task.completed = true 
        @task.save
        redirect_to list_path(@list)
    end 

    def edit
        @task = @list.tasks.find(params[:id])
    end 

    def update 
        @task = @list.tasks.find(params[:id])
        if @task.update_attributes(params[:task])
            flash[:notice] = "List updated"
            redirect_to list_path(@list)
        else 
            flash[:error] = "Could not update list"
            redirect_to edit_list_task_path(@list)
        end 
    end 
    
    # def destroy
    #     @task = @list.tasks.find(params[:id])
    #     if @task.destroy
    #        flash[:notice] = 'Task has been deleted.'
    #        redirect_to list_path(@list)
    #     else 
    #        flash[:error] = "Could not delete the task"
    #        redirect_to list_path(@list)
    #     end
    # end























    private


    def find_list
        @list = List.find(params[:list_id])
    end  
end

