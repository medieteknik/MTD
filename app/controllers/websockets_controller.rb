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

  def update_need
    # there could probably be a nice else clause here to
    if can?(:update, HostPosition)
      # update Hosts
      position = HostPosition.find(message[:id])
      p 'updating need!'
      if position.update(need: message[:need])
        broadcast_message 'update_need', {:id => position.id, :need => position.need}
      else
        p 'failed need update attempt'
        p message
      end
    end
  end
end
