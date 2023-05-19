tracker = []
cycle_num = 0
clock_vals = 1

commands.each do |comm|
  cycle_num += 1
  tracker << clock_vals*cycle_num if [20, 60, 100, 140, 180, 220].include?(cycle_num)
  if comm.include?("addx")
    cycle_num += 1
    tracker << clock_vals*cycle_num if [20, 60, 100, 140, 180, 220].include?(cycle_num)
    clock_vals += comm.split("addx ").last.to_i
  end
end

tracker.sum


# - - - - - - - - - - - - - - -
# Part 2
# - - - - - - - - - - - - - - -


visual = [[],[],[],[],[],[]]
cycle_num = 0
sprite_pos = 1
counter = 0

commands.each do |comm|
  counter = 0 if counter == 40
  cycle_num += 1
  case cycle_num
  when 1..40
    visual[0] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  when 41..80
    visual[1] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  when 81..120
    visual[2] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  when 121..160
    visual[3] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  when 161..200
    visual[4] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  when 201..240
    visual[5] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
  end
  counter += 1
  counter = 0 if counter == 40
  if comm.include?("addx")
    cycle_num += 1
      case cycle_num
      when 1..40
        visual[0] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      when 41..80
        visual[1] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      when 81..120
        visual[2] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      when 121..160
        visual[3] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      when 161..200
        visual[4] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      when 201..240
        visual[5] << ([sprite_pos-1, sprite_pos, sprite_pos+1].include?(counter) ? "#" : ".")
      end
    sprite_pos += comm.split("addx ").last.to_i
    counter += 1
  end
end

visual.each { |g| puts g.join("") }


commands = [
"addx 1",
"addx 4",
"addx 1",
"noop",
"addx 4",
"noop",
"noop",
"noop",
"noop",
"addx 4",
"addx 1",
"addx 5",
"noop",
"noop",
"addx 5",
"addx -1",
"addx 3",
"addx 3",
"addx 1",
"noop",
"noop",
"addx 4",
"addx 1",
"noop",
"addx -38",
"addx 10",
"noop",
"noop",
"noop",
"noop",
"noop",
"addx 2",
"addx 3",
"addx -2",
"addx 2",
"addx 5",
"addx 2",
"addx -13",
"addx 14",
"addx 2",
"noop",
"noop",
"addx -9",
"addx 19",
"addx -2",
"addx 2",
"addx -9",
"addx -24",
"addx 1",
"addx 6",
"noop",
"noop",
"addx -2",
"addx 5",
"noop",
"noop",
"addx -12",
"addx 15",
"noop",
"addx 3",
"addx 3",
"addx 1",
"addx 5",
"noop",
"noop",
"noop",
"noop",
"addx -24",
"addx 29",
"addx 5",
"noop",
"noop",
"addx -37",
"noop",
"addx 26",
"noop",
"noop",
"addx -18",
"addx 28",
"addx -24",
"addx 17",
"addx -16",
"addx 4",
"noop",
"addx 5",
"addx -2",
"addx 5",
"addx 2",
"addx -18",
"addx 24",
"noop",
"addx -2",
"addx 10",
"addx -6",
"addx -12",
"addx -23",
"noop",
"addx 41",
"addx -34",
"addx 30",
"addx -25",
"noop",
"addx 16",
"addx -15",
"addx 2",
"addx -12",
"addx 19",
"addx 3",
"noop",
"addx 2",
"addx -27",
"addx 36",
"addx -6",
"noop",
"noop",
"addx 7",
"addx -33",
"addx -4",
"noop",
"addx 24",
"noop",
"addx -17",
"addx 1",
"noop",
"addx 4",
"addx 1",
"addx 14",
"addx -12",
"addx -14",
"addx 21",
"noop",
"noop",
"noop",
"addx 5",
"addx -17",
"addx 1",
"addx 20",
"addx 2",
"noop",
"addx 2",
"noop",
"noop",
"noop",
"noop",
"noop",]
