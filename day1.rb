list = ""
chunked_list = list.split("\n\n")

elves = {}
elf_counter = 1

chunked_list.each do |cals_list|
  chunked_cals = cals_list.split("\n")
  num_cals = chunked_cals.map { |g| g.to_i }
  elves[elf_counter] = num_cals.sum
  elf_counter += 1
end

backup = elves
elves.count

max1 = elves.values.max
key1 = elves.key(max1)
elves.except!(key1)
elves.count

max2 = elves.values.max
key2 = elves.key(max2)
elves.except!(key2)
elves.count

max3 = elves.values.max
key3 = elves.key(max3)
elves.except!(key3)
elves.count

max1+max2+max3
