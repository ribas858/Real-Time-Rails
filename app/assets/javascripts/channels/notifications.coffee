App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data['notification']
      $('[data-behavior~=notices]').prepend(data['notification'])
      #$('[data-behavior~=notices]').prepend "<div class='event' style='width: 100px; height: 111px; background-color: black; color: white;'>#{data.body}</div>"

    if data['success']
      alert data['success']