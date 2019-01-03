function madlib(verb, adj, noun) {
    return "We shall " + verb.toUpperCase() + " make the " + adj.toUpperCase() + " " + noun.toUpperCase();
}

function isSubstring(searchString, subString) {
    return searchString.includes(subString);
}

function fizzBuzz(array) {
    var finalArray = [];
    array.forEach(el => {
        if ((el % 3 === 0) ^ (el % 5 === 0)) {
            finalArray.push(el);
        }
    })

    return finalArray;
}

function isPrime(num) {
    if (num < 2) return false;

    for (var i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrimes(n) {
    var sum = 0;
    var sumCounter = 0;
    let i = 2; 

    while (sumCounter <= n) {
        if (isPrime(i)) {
            sum += i
            sumCounter++;
        }
        i++;
    }
    
    return sum;
}