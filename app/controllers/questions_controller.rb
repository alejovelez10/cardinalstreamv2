class QuestionsController < ApplicationController
	def create_question
        
      @question = Question.new(event_id: params[:event_id],account_id:params[:account_id],name:params[:name], email:params[:email],description:params[:description],affair:params[:affair] )
        if @question.save
                QuestionMailer.send_question(@question).deliver
        end
    
		
	end
end
