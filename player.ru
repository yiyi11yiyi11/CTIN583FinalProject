on load do
	r_thresh = 10
	l_thresh = -10
	d_thresh = -5
	u_thresh = 5
	wait_time = 0.2
end

on crank do
	new_ra = event.ra
	x = event.px
	y = event.py
	
	if new_ra>r_thresh then
		x += 1
	elseif new_ra<l_thresh then
		x -= 1
	elseif new_ra<d_thresh then
		y += 1
	elseif new_ra>u_thresh then
		y -= 1
	end
	did_move = 0
	if x!=event.px then
		did_move = 1
	end
	if y!=event.py then
		did_move = 1
	end
	if did_move==1 then
		is_solid = solid x,y
		tile_type = type x,y
		
		if tile_type=="sprite" then
			tell x,y to
				call "interact"
			end
		end
		if is_solid==0 then
			goto x,y
			if tile_type=="item" then
				act
			else
				ignore
				wait wait_time then
					listen
				end
			end
		end
		if x==12 then
			if y==11 then
				fin "You went outside to play.\n\nThe End"
			end
		end
	end
end