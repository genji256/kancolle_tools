#! /usr/bin/env ruby

#---------------------------------------------------------------------------
#
#.kancolleposの情報を読み込むクラス
#
#---------------------------------------------------------------------------

require "./lib/positionManager.rb"

class InputPosition

	#初期化
	def initialize ()
		@data = Array.new
		path = "./.kancollepos"

		File::open(path) { |file|
			file.each_with_index { |line, i|
				if i >=6 && i % 2 == 0
					dump = line.to_s.split(" ")
					if i == 6
						@aX = dump[0]
						@aY = dump[1]
					else
						@data << PositionManager.new(@aX, @aY, dump[0], dump[1])
					end	
				end
			}
		}

	end

	def getData
		return @data
	end

end

