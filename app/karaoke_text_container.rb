class KaraokeTextContainer < NSTextStorage

	def init
		if super
			@@expression = nil
			@imp = NSMutableAttributedString.alloc.init
		end
		self
	end

	def string
		return @imp.string
	end

	def attributesAtIndex(location, effectiveRange: range)
		return @imp.attributesAtIndex(location, effectiveRange: range)
	end

	def replaceCharactersInRange(range, withString: str)
		@imp.replaceCharactersInRange(range, withString: str)
		edited(NSTextStorageEditedCharacters, range: range, changeInLength: str.length - range.length)
	end

	def setAttributes(attrs, range: range)
		@imp.setAttributes(attrs, range: range)
		edited(NSTextStorageEditedAttributes, range: range, changeInLength: 0)
	end

	def begin
		@currentMatch 		= 0
#		@exp 							= NSRegularExpression.regularExpressionWithPattern("\\b[a-zA-Z]*\\b", options: 0, error: nil)
		@exp 							= NSRegularExpression.regularExpressionWithPattern("\\w", options: 0, error: nil)
		@range 						= NSMakeRange(0, self.string.length)
		@hits = []
		@exp.enumerateMatchesInString(self.string, options: 0, range: @range, usingBlock: lambda do |result, flags, stop|
			@hits.push(result.range) unless result.range.length == 0
		end)
		NSLog(@hits.length.to_s)
		EM.add_periodic_timer(0.12) do 
			beginEditing
			self.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor, range: @hits[@currentMatch])
#			self.addAttribute(NSBackgroundColorAttributeName, value: UIColor.blueColor, range: @hits[@currentMatch])
			endEditing
			@currentMatch += 1
		end
	end

end