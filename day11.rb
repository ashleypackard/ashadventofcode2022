monkeys = {
  "0" => {
    items: [52, 60, 85, 69, 75, 75],
    worry_inc: ["*", 17],
    worry_test: 13,
    monkey_true: "6",
    monkey_false: "7",
    items_inspected: 0
  },
  "1" => {
    items: [96, 82, 61, 99, 82, 84, 85],
    worry_inc: ["+", 8],
    worry_test: 7,
    monkey_true: "0",
    monkey_false: "7",
    items_inspected: 0
  },
  "2" => {
    items: [95, 79],
    worry_inc: ["+", 6],
    worry_test: 19,
    monkey_true: "5",
    monkey_false: "3",
    items_inspected: 0
  },
  "3" => {
    items: [88, 50, 82, 65, 77],
    worry_inc: ["*", 19],
    worry_test: 2,
    monkey_true: "4",
    monkey_false: "1",
    items_inspected: 0
  },
  "4" => {
    items: [66, 90, 59, 90, 87, 63, 53, 88],
    worry_inc: ["+", 7],
    worry_test: 5,
    monkey_true: "1",
    monkey_false: "0",
    items_inspected: 0
  },
  "5" => {
    items: [92, 75, 62],
    worry_inc: ["*", 0],
    worry_test: 3,
    monkey_true: "3",
    monkey_false: "4",
    items_inspected: 0
  },
  "6" => {
    items: [94, 86, 76, 67],
    worry_inc: ["+", 1],
    worry_test: 11,
    monkey_true: "5",
    monkey_false: "2",
    items_inspected: 0
  },
  "7" => {
    items: [57],
    worry_inc: ["+", 2],
    worry_test: 17,
    monkey_true: "6",
    monkey_false: "2",
    items_inspected: 0
  }
}

(1..20).each do |round|
  (0..7).each do |monkey|
    monkeys["#{monkey}"][:items_inspected] += monkeys["#{monkey}"][:items].count
    (1..monkeys["#{monkey}"][:items].count).each do |i|
      item = monkeys["#{monkey}"][:items].shift
      wlevel = monkeys["#{monkey}"][:worry_inc][1] != 0 ? monkeys["#{monkey}"][:worry_inc][1] : item
      new_worry = monkeys["#{monkey}"][:worry_inc][0] == "*" ? (item * wlevel) : ( item + wlevel)
      new_worry = new_worry / 3
      if new_worry % monkeys["#{monkey}"][:worry_test] == 0
        monkeys[monkeys["#{monkey}"][:monkey_true]][:items] << new_worry
      else
        monkeys[monkeys["#{monkey}"][:monkey_false]][:items] << new_worry
      end
    end
  end
end

monkeys.each do |k,v|
  puts "#{k}: #{v[:items_inspected]}"
end


# - - - - - - - - - - - - - - -
# Part 2
# - - - - - - - - - - - - - - -

mod = 1
monkeys.each do |k,v|
  mod = v[:worry_test]*mod
end

(1..10000).each do |round|
  puts "- - - - - - - - - - - - - - ROUND #{round} - - - - - - - - - - - - - -"
  (0..7).each do |monkey|
    item_count = monkeys["#{monkey}"][:items].count
    puts "MONKEY #{monkey} has #{item_count} items"
    monkeys["#{monkey}"][:items_inspected] += item_count
    (1..item_count).each do |i|
      item = monkeys["#{monkey}"][:items].shift
      wlevel = monkeys["#{monkey}"][:worry_inc][1] != 0 ? monkeys["#{monkey}"][:worry_inc][1] : item
      new_worry = monkeys["#{monkey}"][:worry_inc][0] == "*" ? (item * wlevel) : ( item + wlevel)
      new_worry = new_worry % mod
      if new_worry % monkeys["#{monkey}"][:worry_test] == 0
        monkeys[monkeys["#{monkey}"][:monkey_true]][:items] << new_worry
      else
        monkeys[monkeys["#{monkey}"][:monkey_false]][:items] << new_worry
      end
    end
  end
end

monkeys.each do |k,v|
  puts "#{k}: #{v[:items_inspected]}"
end



# - - - - - - - - - - - - - - -
# INPUT
# - - - - - - - - - - - - - - -

# Monkey 0:
#   Starting items: 52, 60, 85, 69, 75, 75
#   Operation: new = old * 17
#   Test: divisible by 13
#     If true: throw to monkey 6
#     If false: throw to monkey 7

# Monkey 1:
#   Starting items: 96, 82, 61, 99, 82, 84, 85
#   Operation: new = old + 8
#   Test: divisible by 7
#     If true: throw to monkey 0
#     If false: throw to monkey 7

# Monkey 2:
#   Starting items: 95, 79
#   Operation: new = old + 6
#   Test: divisible by 19
#     If true: throw to monkey 5
#     If false: throw to monkey 3

# Monkey 3:
#   Starting items: 88, 50, 82, 65, 77
#   Operation: new = old * 19
#   Test: divisible by 2
#     If true: throw to monkey 4
#     If false: throw to monkey 1

# Monkey 4:
#   Starting items: 66, 90, 59, 90, 87, 63, 53, 88
#   Operation: new = old + 7
#   Test: divisible by 5
#     If true: throw to monkey 1
#     If false: throw to monkey 0

# Monkey 5:
#   Starting items: 92, 75, 62
#   Operation: new = old * old
#   Test: divisible by 3
#     If true: throw to monkey 3
#     If false: throw to monkey 4

# Monkey 6:
#   Starting items: 94, 86, 76, 67
#   Operation: new = old + 1
#   Test: divisible by 11
#     If true: throw to monkey 5
#     If false: throw to monkey 2

# Monkey 7:
#   Starting items: 57
#   Operation: new = old + 2
#   Test: divisible by 17
#     If true: throw to monkey 6
#     If false: throw to monkey 2
