class KaraokeController < UIViewController

	def init
		if super

		end
		self
	end

	def loadView
		self.view = KaraokeView.alloc.initWithFrame(CGRectMake(0, 0, Device.screen.width, Device.screen.height))
	end

	def viewDidLoad
		@storage = KaraokeTextContainer.alloc.init
		@storage.addLayoutManager(self.view.content.layoutManager)
		@storage.replaceCharactersInRange(NSMakeRange(0, 0), withString: NSString.stringWithContentsOfURL(NSBundle.mainBundle.URLForResource('text', withExtension: 'txt'), usedEncoding: nil, error: nil))
		@storage.begin
	end

end