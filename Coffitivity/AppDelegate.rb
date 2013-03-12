#
#  AppDelegate.rb
#  Coffitivity
#
#  Created by Mick Staugaard on 3/11/13.
#  Copyright 2013 Mick Staugaard. All rights reserved.
#

class AppDelegate
    attr_accessor :imageView
    attr_accessor :logoMenuItem

    attr_accessor :volumeSlider
    
    attr_accessor :statusMenu
    attr_accessor :statusItem

    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end

    def awakeFromNib
        imageView.image = image('http://coffitivity.com/images/coff_logobanner.png', [ 200, 51 ])
        
        @statusItem = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength)
        @statusItem.menu = statusMenu
        @statusItem.image = image('http://coffitivity.com/images/favicon.ico', [ 17, 17 ])
        @statusItem.highlightMode = true

        volumeSlider.floatValue = volume
    end

    def sound
        @sound ||= NSSound.alloc.initWithContentsOfURL(NSURL.alloc.initWithString('http://coffitivity.com/other/audio3.mp3'), byReference: true).tap do |s|
            s.loops = true
            s.volume = volume
        end
    end

    def volume
       NSUserDefaults.standardUserDefaults.floatForKey('volume') || 0.65
    end

    def volume=(value)
        NSUserDefaults.standardUserDefaults.setFloat(value, forKey: 'volume')
        NSUserDefaults.standardUserDefaults.synchronize
    end
    
    def toggleProductivity(sender)
        if sender.state == NSOnState
            sound.play
        else
            sound.stop
        end
    end

    def changeVolume(sender)
        sound.volume = sender.floatValue
        self.volume = sender.floatValue
    end
    
    private
    
    def image(url, size)
        the_url = NSURL.alloc.initWithString(url)
        img = NSImage.alloc.initByReferencingURL(the_url)
        img.size = size
        img
    end
end

