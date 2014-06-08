// Too lazy to test drive this, a kitten died while coding it.
// Compile with `xcrun swift main.swift`

extension Array {
    func fetch(index: Int) -> T? {
        if index >= 0 && index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}

func FizzBuzz(n: Int) -> String {
    switch (n % 3, n % 5) {
        case (0, 0): return "FizzBuzz"
        case (0, _): return "Fizz"
        case (_, 0): return "Buzz"
        default:     return String(n)
    }
}

let argc = Int(C_ARGC)
let argv = Array(UnsafeArray(start: C_ARGV, length: argc)).map {
    String.fromCString($0)
}

if let number = argv.fetch(1)?.toInt() {
    for i in 1...number { println(FizzBuzz(i)) }
} else {
    println("Wrong arguments")
    println("Usage: ./fizzbuzz Num")
}
