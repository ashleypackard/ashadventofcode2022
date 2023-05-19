# A for Rock
# B for Paper
# C for Scissors

rounds = moveslist.split("\n")

payout = {
  "A" => 1,
  "B" => 2,
  "C" => 3
}

sum = 0
rounds.each do |round|
  moves = round.split(" ")
  sum += payout[moves[1]]

  # puts "ELF: #{moves[0]} | ME: #{moves[1]}"

  if moves[0] == moves[1]
    # puts "DRAW"
    sum += 3
  elsif winner(moves[0], moves[1])
    # puts "ASH WINS"
    sum += 6
  end
end

def winner(elf, ash)
  case ash
  when "A"
    if elf == "C"
      true
    else
      false
    end
  when "B"
    if elf == "A"
      true
    else
      false
    end
  when "C"
    if elf == "B"
      true
    else
      false
    end
  else
    false
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# round 2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# X for losing
# Y for tie
# Z for winning

rounds = moveslist.split("\n")

payout = {
  "A" => 1,
  "B" => 2,
  "C" => 3
}

sum = 0
rounds.each do |round|
  moves = round.split(" ")

  # puts "ELF: #{moves[0]} | ME: #{moves[1]}"

  case moves[1]
  when "Y"
    # puts "DRAW"
    sum += payout[moves[0]]
    sum += 3
  when "Z"
    # win
    sum += payout[selectMove(moves[0], true)]
    sum += 6
  else
    # lose
    sum += payout[selectMove(moves[0], false)]
  end
end

def selectMove(elf, wins)
  case elf
  when "A"
    if wins
      "B"
    else
      "C"
    end
  when "B"
    if wins
      "C"
    else
      "A"
    end
  when "C"
    if wins
      "A"
    else
      "B"
    end
  end
end

# A for Rock
# B for Paper
# C for Scissors
