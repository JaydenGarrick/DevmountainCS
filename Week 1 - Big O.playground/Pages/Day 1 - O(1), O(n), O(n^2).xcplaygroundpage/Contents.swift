// Big O Day 1 - O(1), O(n), O(n^2)


var array: [Int] = [1,2,3,4,5,6,7,8,9,10]




// O(1)
// O(6) == O(1)
for i in 0...5 {
    print(array[i])
}

//Adding big O together
// O(n + n) = O(2n) = O(n)
for i in array {
    print(i)
}
// +
for i in array {
    print(i)
}

//Multiplying big O together
// O(n * n) == O(n^2)
for i in array {
    for j in array {
        print("\(i)\(j)")
    }
}






// O(n^3)
for i in array { //O(n)
    for j in array { // O(n)
        for k in array { // O(n)
            print("\(i)\(j)\(k)")
        }
    }
}

// Gotcha with algorithms
func badLinearSearch(n: [Int], element: Int) -> Bool {
    var found = false
    
    for i in 0...n.count - 1 {
        if n[i] == element {
            found = true
        }
    }
    
    return found
}

func goodLinearSearchButStillLinear(n: [Int], element: Int) -> Bool {
    for i in n {
        if i == element {
            return true
        }
    }
    return false
}



// What is the Big O of the following funciton?
// O(n^2 + n^3) -> O(n^3)

// n((n*1) + (n*n))
// n(n + n^2)
// n^2 + n^3
// n^3

for i in array { // O(n)
    for j1 in array { // O(n)
        for k in 0...3 { // O(1)
            print("\(i)\(j1)\(k)")
        }
    }
    
    
    for j2 in array { // O(n)
        for k in array { // O(n)
            print("\(i)\(j2)\(k)")
        }
    }
}










// Simplifying Big O

// O(n/2) == O(n)
for value in array where value < array.count/2 {
    print(value)
}



// How far can we simplify?

var posts: [Int] = [1,2,3,4,5,6,7,8,9,10]
var comments: [Int] = [1,2,3,4,5,6]
// let p = posts.count
// let c = comments.count

// O(pc)
for post in posts {
    for comment in comments {
        print("\(post)\(comment)")
    }
}


// O(p + c)
for post in posts {
    print("\(post)")
}
for comment in comments {
    print("\(comment)")
}




