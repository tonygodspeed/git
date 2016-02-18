function trim_right( buf, trim_char)
	--print(#(trim_char))
	--LogOut("xxx1")
	x = string.find(buf,trim_char)
	--LogOut("xxx2")
	if (x ~= nil)
	then
		--LogOut("xxx3")
		str = string.sub(buf,0,x-1)
	else
		--LogOut(buf)
		--LogOut(trim_char)
		str = buf
	end
	--LogOut("xxx5")
return str
end


function trim_left( buf,trim_char )
	--print("trim_right org " , buf,"trim_char = ",trim_char)
	local x = (string.find(buf,trim_char))
	if (x ~= nil)
	then
		magic_start = string.find(trim_char,"%%")
		--print(magic_cnt)
		magic_cnt = 0
		if(magic_start ~= nil)
			then
				magic_cnt = 1
			end
		str = string.sub(buf,x+string.len(trim_char)-magic_cnt,-1)
		--print("trim_right " , str)
		trim_left(str,trim_char)
	else
		--LogOut(buf)
		--LogOut(trim_char)
		str = buf
	end
return str
end

function trim_left_right( buf,left_char,right_char )
	--LogOut(buf)
	res = trim_right(buf,right_char)
	--LogOut(res)
	str = trim_left(res,left_char)
	--LogOut(str)
return str
end

function  LogOut( t )
	cpp_dbg_log(t)
end

function common_filter( buf )
----[[
	local str = trim_right(buf,"-")
	str = trim_right(str,"—")
	str = trim_right(str,"–")
	str = trim_right(str,"_")
	str = trim_left_right(str,"《","》")
	str = string.gsub(str,"\"","")
	str = string.gsub(str,"“","")
	str = string.gsub(str,"”","")
--]]
	str = trim_left_right(buf,"《","》")
	return str
end

function lua_func(arg1)
	return arg1*2
end
