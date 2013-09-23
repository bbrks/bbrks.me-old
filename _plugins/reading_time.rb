# Outputs the reading time

# E.g. " ~ 4 minute read"
# Put into your _plugins dir in your Jekyll site
# Usage: Read this in about {{ page.content | reading_time }}

module ReadingTimeFilter
	def reading_time( input )
		words_per_minute = 175

		words = input.split.size;
		minutes = ( words / words_per_minute ).floor
		minutes > 0 ? " ~ #{minutes} minute read" : ""
	end
end

Liquid::Template.register_filter(ReadingTimeFilter)
