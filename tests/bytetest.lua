-- A quick and dirty test for the bytelib
bl = require( "bytelib" )

local var = "a"
print( var:byte() )

-- part 1: converting dec to bin
bin = bl.convertByteToBinary( var:byte() )
print( table.concat( bin, " " ) )


--part 2: the right shift
bin = bl.circularShiftRight( bin, 5 )
print( table.concat( bin, " " ) )

--part 3: the left shift
bin = bl.circularShiftLeft( bin, 5 )
print( table.concat( bin, " " ) )

--part 4: converting bin to dec
bin = bl.convertBinaryToByte( bin )
print( bin )
