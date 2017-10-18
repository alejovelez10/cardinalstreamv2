class QuestionsController < ApplicationController
	def create_question
        
      @question = Question.new(event_id: params[:event_id],account_id:params[:account_id],name:params[:name], email:params[:email],description:params[:description],affair:params[:affair] )
        if @question.save
        	     event = Event.find(@question.event_id)   
        	   
        	        event.ask_emails.each do |email|
        	        	
                    QuestionMailer.send_question(@question, email.email).deliver
                end               

        end
    
		
	end
end
