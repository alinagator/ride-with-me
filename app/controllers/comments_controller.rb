class CommentsController < ApplicationController
	def create
		if user_signed_in?
			safe_comment = params.require(:comment).permit(:post).merge(ride_id: params[:ride_id])
			@comment = current_user.comments.create safe_comment
			redirect_to @comment.ride
		else
			redirect_to new_user_session_path, alert: "Please log-in or sign-up to leave a comment."
		end
	end
end