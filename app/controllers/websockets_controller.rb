class WebsocketsController < WebsocketRails::BaseController
  def update_hosts
    # there could probably be a nice else clause here to
    if can?(:update, Host)
      # update Hosts
      host = Host.find(message[:id])
      p 'updating user!'
      if host.update(position: message[:position])
        broadcast_message 'update_hosts', {:id => host.id, :position => host.position}
      else
        p 'failed update attempt'
        p message
      end
    end
  end
end
