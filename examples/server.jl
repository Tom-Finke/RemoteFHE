using RemoteFHE
using Logging, LoggingExtras

logger = FormatLogger("server.log"; append=false) do io, args
    println(io, "[$(args.level)] $(args.message)")
end
global_logger(logger)

RemoteFHE.run_server(8080)
