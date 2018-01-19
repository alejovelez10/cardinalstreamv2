class QuestionMailer < ApplicationMailer
def send_question(question, email)
  @question = question

 
  mail(to: email, subject: "Pregunta en webmaster de transmisión")
end
end
