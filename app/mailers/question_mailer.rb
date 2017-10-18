class QuestionMailer < ApplicationMailer
def send_question(question, email)
  @question = question

 
  mail(to: email, subject: "Se ha creado una pregunta")
end
end
