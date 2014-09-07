# -*- coding: utf-8 -*-

Plugin.create :plus_one do

  command(:plus_one,
          name: '+1する',
          condition: lambda{ |opt| true },
          visible: true,
          icon: File.expand_path(File.join(File.dirname(__FILE__), "+1.png")),
          role: :timeline) do |opt|
    opt.messages.each { |m|
      Service.primary.post(:message => "@#{m.user.to_s} +1", :replyto => m)
    }
  end

end
