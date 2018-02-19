class QuestionsController < ApplicationController
	def create_question
        
      @question = Question.new(event_id: params[:event_id],account_id:params[:account_id],name:params[:name], email:params[:email],description:params[:description],affair:params[:affair], date_time: Time.now() )
        if @question.save
        	     event = Event.find(@question.event_id)   
        	   
        	        event.ask_emails.each do |email|
        	        	
                    QuestionMailer.send_question(@question, email.email).deliver
                end               

        end
    
		
	end

    def delete_question 
        
        @question = Question.find(params[:id])
        @event_id = @question.event_id
        if @question.destroy
                redirect_to real_time_stats_path(@event_id)
            end
        
    end
end
