# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  
  def registration_confirmation
    UserMailer.registration_confirmation(User.new(email: "test@localhost.com"))
  end
  
end
