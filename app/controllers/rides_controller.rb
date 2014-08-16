class RidesController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :join]
	before_action :check_ownership, only: [:edit, :update]
  	before_action :load_ride, except: [:new, :index, :create] 


	def index
		@rides = Ride.search_for(params[:q])
	end

	def show
		@comment = Comment.new
	end

	def new
		@ride = Ride.new
	end

	def create #saves to database (req'd as well as 'new' method)
		@ride = current_user.rides.build(safe_ride_params)

		if @ride.save
			redirect_to @ride
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @ride.update safe_ride_params
			redirect_to @ride
		else
			render 'edit'
		end
	end

	def join
		if @ride.users.include? current_user
			redirect_to @ride, notice: "You're already on this ride, idiot."
		else
			@ride.users << current_user
			redirect_to @ride
		end
	end

	private

		def load_ride
			@ride = Ride.find(params[:id])
		end

		def safe_ride_params
			params.require(:ride).permit(:name, :description, :map, :distance, :date, :time)
		end

		def check_ownership
     		@ride = Ride.find params[:id]
      		if @ride.user.try(:id) != current_user.id
        	flash[:alert] = "You do not have permission to edit this ride"
        	redirect_to @ride
     	end
    end

end