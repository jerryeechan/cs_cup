class NotifyAll < ApplicationMailer
	def confirm(email)    
    mail(:to =>email,:subject=>"中資盃  秩序手冊")
  end
end
