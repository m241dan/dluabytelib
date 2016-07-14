function convertByteToBinaryTable( decimal )
   local binary_tab = {}
   local maxbit = 128

   repeat
      if( decimal - maxbit >= 0 ) then
         binary_tab[#binary_tab+1] = "1"
         decimal = decimal - maxbit
         maxbit = maxbit / 2
      else
         binary_tab[#binary_tab+1] = "0"
         maxbit = maxbit / 2
      end
   until maxbit == .5

   return binary_tab
end

function shiftRightOnByteBinaryTable( binary_table, shift )
   local shifted_tab = {}

   for i, v in ipairs( binary_table ) do
      shifted_tab[( i + shift ) % 8] = v
   end

   shifted_tab[8] = shifted_tab[0]
   shifted_tab[0] = nil

   print( table.concat( shifted_tab, " " ) )
   return shifted_tab
end

local var = "a"

print( var:byte() )
print( table.concat( convertByteToBinaryTable( var:byte() ), " " ) )
print( table.concat( shiftRightOnByteBinaryTable( convertByteToBinaryTable( var:byte() ), 5 ), " " ) )

