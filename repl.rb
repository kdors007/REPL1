your_dice = [1, 2, 3, 4, 5, 6]
my_dice = [1, 2, 3, 4, 5, 6]
your_money = 200
my_money = 400


puts "The objective of this game is simple. 
Roll higher than me and you can be $400 richer.
After each win/loss you get a new set of dice with a lower/higher ceiling.
(EX) You lose your first roll, you get two 7 sided dice and I get two 5 
sided dice etc (up to twelve, and down to three)."
puts "You have 200 dollars in singles on you.
After every bet the wager increases 10 percent!"

puts "Ready to roll?(Y/N)"
choice = gets.chomp
if choice == "Y"
	puts "How much money would you like to wager?"
	wager = gets.chomp.to_i

elsif choice == "N" 
		puts "Thats cool."
	else
		puts "That's not an option! Give a valid choice."
		gets.chomp
	end
	
	while your_money > 0
your_results = your_dice.sample.to_i + your_dice.sample.to_i
my_results = my_dice.sample.to_i + my_dice.sample.to_i
	if your_money < wager 
		wager = your_money
	end
	if my_money < wager
		wager = my_money
	end

		puts "Your using a #{your_dice.length} sided dice while mines has #{my_dice.length} sides."
		puts "Your dice roll results: #{your_results}"
		puts "My dice roll results: #{my_results}"
		if your_results > my_results
			puts "Congrats, heres $#{wager}. Like to roll again?"
			choice = gets.chomp
			your_money += wager
			puts "You have $#{your_money} left"
			your_dice.pop
			my_dice.push(my_dice.length + 1)
			wager *= 1.10
			wager = wager.to_i
		elsif your_results < my_results
		 	 
			puts "Thank you. Would you like to roll again?"
			choice = gets.chomp
			your_money -= wager
			puts "You have $#{your_money} left"
			my_dice.pop
			your_dice.push(my_dice.length + 1)
			wager *= 1.10
			wager = wager.to_i
		else 
			puts "It's a tie, roll again?"
		end
	end
