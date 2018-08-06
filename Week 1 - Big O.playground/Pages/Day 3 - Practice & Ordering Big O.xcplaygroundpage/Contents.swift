// Big O Day 3 - Practice & Ordering Big O


// Here are some previous stretch problems and their solutions. We're going to analyze their Big O.
func isPalindrome(_ input: String) -> Bool {
    let simpleInput = input.lowercased().components(separatedBy: .whitespacesAndNewlines).joined()
    return String(simpleInput.reversed()) == simpleInput
}




func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        if a > b {
            return gcd(a-b, b)
        } else {
            return gcd(a, b-a)
        }
    }
}




func gcdEuclid(_ a: Int, _ b: Int) -> Int {
    let remainder = a % b
    if remainder == 0 {
        return b
    } else {
        return gcdEuclid(b, remainder)
    }
}






func add(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}


