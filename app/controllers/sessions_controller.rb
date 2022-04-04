class SessionsController < ApplicationController



def new

end

def create
sign=Sign.find_by(mail: params[:session][:mail].downcase)
if sign && sign.authenticate(params[:session][:password])
  session[:sign_id] =sign.id
  flash[:notice] ="Logged succefully"
  redirect_to sign
else
 flash.now[:alert]="there was something wrong in your lolgin details"

 render 'new'
 end

end

def destroy
  session[:sign_id]=nil
  flash[:notice]= "logged out"
  redirect_to root_path

end

end
