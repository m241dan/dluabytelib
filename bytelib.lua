local bl = {}

local conversion_tab = { 128, 64, 32, 16, 8, 4, 2, 1 }

function bl.convertByteToBinary( decimal )
   local binary_tab = {}
   local maxbit = 128

   for i, v in ipairs( conversation_tab ) do
      if( decimal - conversion_tab[i] >= 0 ) then
         binary_tab[i] = 1
         decimal = decimal - conversion_tab[i]
      else
         binary_tab[i] = 0
      end
   end
--[[
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
--]]
   return binary_tab
end

function bl.convertBinaryToByte( binary )
   local byte
   
end

local function shift( bin, shift_amount, right_shift )
   local shifted_tab = {}

   --some quick and dirty type checking
   bin_type = type( bin )
   if( bin_type == "number" ) then
      bin = bl.convertByteToBinary( bin )
   elseif( bin_type ~= "table" ) then
      error( "expecting either a byte table or byte sized integer, get " .. bin_type .. " instead." )
   end

   for i, v in ipairs( bin ) do
      if( right_shift ) then
         shifted_tab[( i + shift_amount ) % 8] = v
      else

         shifted_tab[( i - shift_amount ) % 8] = v
      end
   end

    --handle some awkward mod action here
   shifted_tab[8] = shifted_tab[0]
   shifted_tab[0] = nil

   return shifted_tab
end

-- "right" wrapper for the shift function
function bl.circularShiftRight( bin, shift_amount )
   if( shift_amount < 1 or shift_amount > 7 ) then
      error( "Bad shift amount entered" )
   end
   return shift( bin, shift_amount, true )
end
-- "left" wrapper for the shift function
function bl.circularShiftLeft( bin, shift_amount )
   return shift( bin, shift_amount, false )
end

return bl
