require 'bunny'

queue_conn = Bunny.new(hostname: 'rabbit.local')
queue_conn.start

queue_chan = queue_conn.create_channel
