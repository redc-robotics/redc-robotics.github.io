class TeamMailer < ApplicationMailer
  default from: "null2@illinois.edu"

  def single_mail(user, sub)
  	@user = user
  	mail(to: @user.email, subject: sub)
  end

  def team_mail(sub)
    @users = User.where({member: true})
    @users.each do |user|
      mail(to: @user.email, subject: sub)
    end
	end
end
