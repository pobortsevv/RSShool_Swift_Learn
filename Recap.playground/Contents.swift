class Player {
	
	let name: String
	let game: String
	let age: Int
	
	var playerInfo: String {
		let playerInfo = """
		Player name is \(name).
		He plays \(game).
		He is \(age) years old.
		"""
		return playerInfo
	}
	
	init(name: String, game: String, age: Int) {
		self.name = name
		self.game = game
		self.age = age
	}
}



protocol PolitePlayer {
	var friends: [Player] { get }
	var haveAFriend: Bool { get }
	
	func smile()
	func apologize() -> String
}

class ProPlayer : Player {
	let experience: Int
	let retirementAge: Int
	
	init(name: String, game: String, age: Int, experience: Int, retirementAge: Int) {
		self.experience = experience
		self.retirementAge = retirementAge
		super.init(name: name, game: game, age: age)
	}
}

extension ProPlayer: PolitePlayer {
	var friends: [Player] {
		return [Player(name: "Alex", game: "Football", age: 19)]
	}

	var haveAFriend: Bool {
		return !friends.isEmpty
	}

	func smile() {
		print("Let's smile together")
	}

	func apologize() -> String {
		return "Sorry, friend"
	}
}

let player = Player(name: "Alex", game: "Football", age: 19)
print(player.playerInfo)

let pro = ProPlayer(name: "Mario", game: "Hockey", age: 26, experience: 8, retirementAge: 37)
print("\n")
print(pro.playerInfo)

pro.apologize()
