class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notice)
    # Do something later
    ActionCable.server.broadcast "notifications:#{notice.recipient_id}",
                                 notification: render_notification(notice)
    ActionCable.server.broadcast "notifications:#{notice.sender_id}",
                                 success: 'Aviso enviado com sucesso!'
  end

  private
  def render_notification(notice)
    ApplicationController.renderer.render(
      partial: 'notices/new_notification.html.erb',
      locals: { notification: notice}
    )
  end
end