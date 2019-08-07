class NoticesController < ApplicationController
    def create
        @notice = Notice.new(notice_params)
        respond_to do |format|
          if @notice.save
            format.html { redirect_to root_path }
          end
        end
    end

    def notifications
      @notices = Notice.where(recipient: current_user)
      respond_to do |format|
        format.js
      end
    end
    
    private
    def notice_params
        params.require(:notice).permit(:body, :sender_id, :recipient_id)
    end
    
end
