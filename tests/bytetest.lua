-- A quick and dirty test for the bytelib

bl = require( "bytelib" )

local var = "a"
print( var:byte() )

-- part 1: the conversion
bin = bl.convertByteToBinary( var:byte() )
print( table.concat( bin, " " ) )


--part 2: the right shift
bin = bl.circularShiftRight( bin, 5 )
print( table.concat( bin, " " ) )

--part 3: the left shift
bin = bl.circularShiftLeft( bin, 5 )
print( table.concat( bin, " " ) )
--print( table.concat( bl.circularShiftRight( convertByteToBinaryTable( var:byte() ), 5 ), " " ) )
--print( table.concat( bl.circularShiftLeft( con

