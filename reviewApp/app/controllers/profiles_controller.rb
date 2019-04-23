class ProfilesController < ApplicationController

before_action :authorize, :only => [ :index, :destory]

def index
	@profiles=Profile.all
end

def new
	@profile=Profile.new
end

def create 
	@profile=Profile.new(profile_params)
	@profile.userId = current_user.id
	@profile.save
	redirect_to @profile
end

def edit
	@profile = Profile.find(params[:id])
end

def update 
	@profile = Profile.find(params[:id])
	if @profile.update(profile_params)
		redirect_to @profile
	else 
		render 'edit'
	end
end

def destroy
	@profile = Profile.find(params[:id])
	@profile.destroy
	redirect_to profiles_path
end

def show 
	profile = Profile.find_by(userId: params[:id])

	if !profile 
		redirect_to new_profile_path
	else 
		@profile = profile
	end
end

private

def profile_params
	params.require(:profile).permit(:fullName, :dob, :address, :city, :country, :userPhoto, :userId)
end

end

