class KaraokeView < UIView

	attr_reader :content

	def initWithFrame(rect)
		if super

			self.backgroundColor = UIColor.whiteColor

			@content = UITextView.alloc.initWithFrame(CGRectInset(self.bounds, 20, 20))
			@content.backgroundColor = UIColor.whiteColor
			@content.textColor = UIColor.blackColor
			@content.editable = false
			addSubview(@content)
		end
		self
	end


end