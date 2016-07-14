-- A quick and dirty test for the bytelib

bl = require( "bytelib" )

local var = "a"

print( var:byte() )
print( table.concat( convertByteToBinaryTable( var:byte() ), " " ) )
print( table.concat( shiftRightOnByteBinaryTable( convertByteToBinaryTable( var:byte() ), 5 ), " " ) )

