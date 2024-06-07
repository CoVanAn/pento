# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Pento.Catalog

	products = [
	  %{
	    name: "Chess",
	    description: "The classic strategy game",
	    sku: 5_678_910,
	    unit_price: 10.00
	  },
	  %{
	    name: "Tic-Tac-Toe",
	    description: "The game of Xs and Os",
	    sku: 11_121_314, unit_price: 3.00
	  },
	  %{
	    name: "Table Tennis",
	    description: "Bat the ball back and forth. Don't miss!",
	    sku: 15_222_324,
	    unit_price: 12.00
	  }
	]

	Enum.each(products, fn product ->
	  Catalog.create_product(product)
	end)

# alias Pento.Extention

# 	faqs = [
# 		%{
# 			question: "How do I reset my password?",
# 			answer: "To reset your password, go to the login page and click on the 'Forgot Password' link. Follow the instructions to reset your password.",
# 			vote_count: 10
# 		},
# 		%{
# 			question: "How do I update my account information?",
# 			answer: "To update your account information, log in to your account and navigate to the 'Settings' page. From there, you can edit your profile details.",
# 			vote_count: 5
# 		},
# 		%{
# 			question: "What payment methods do you accept?",
# 			answer: "We accept credit cards, PayPal, and bank transfers. You can choose your preferred payment method during checkout.",
# 			vote_count: 8
# 		}
# 	]
# 	Enum.each(faqs, fn faqs ->
# 	  Extention.create_faq(faqs)
# 	end)
