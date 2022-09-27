require 'samp.events'

script_name('Reconnect')
script_author('Rmly')
script_version('1.0')

local prefix = "{0ed2e8}[RECONNECT]:{b9bcbd}"

function main()
  repeat wait(100) until isSampAvailable()
  local ts = thisScript()
  sampAddChatMessage(string.format('%s %s v%s {b9bcbd}by {0ed2e8}%s {b9bcbd}', prefix, ts.name, ts.version, table.concat(ts.authors)))
  sampAddChatMessage(string.format('%s {b9bcbd}Usage: {0ed2e8}/recon <name>', prefix))
  sampRegisterChatCommand("reconnect", reconnect)
  sampRegisterChatCommand("recon", reconnect)
end

function reconnect(name)
  if #name == 0 then
    return sampAddChatMessage(string.format('%s Usage: {0ed2e8}/recon <name>', prefix))
  end

  if name:match("%W") or #name < 3 or #name > 20 then
    return sampAddChatMessage(string.format('%s {ff0000}Invalid name.', prefix))
  end

  ip, port = sampGetCurrentServerAddress()

  sampSetLocalPlayerName(name)
  sampAddChatMessage(string.format('%s Connecting with the name {0ed2e8}%s {b9bcbd}to {0ed2e8}%s:%s', prefix, name, ip, port))
  sampConnectToServer(ip, port)
end