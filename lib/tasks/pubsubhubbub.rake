namespace :pubsubhubbub do
  desc 'execute script.'
  task :exe do
    require 'pubsubhubbub'

    def log msg
      puts ('-'*15)+msg+('-'*15)
    end

    def execute
      log 'start'

      EventMachine.run {
        pub = EventMachine::PubSubHubbub.new('http://pubsubhubbub.appspot.com/publish').publish "http://www.test.com/"

        pub.callback { puts "Successfully notified hub." }
        pub.errback  { puts "Uh oh, something broke: #{pub.response}" }
      }

      log 'end'
    end

    execute
  end
end
