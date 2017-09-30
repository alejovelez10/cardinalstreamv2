class QuestionMailer < ApplicationMailer
def send_question(question)
  @question = question
 
  mail(to: "alejovelez10@gmail.com", subject: "Se ha creado una pregunta")
end
end
