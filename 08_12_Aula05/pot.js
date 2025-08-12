function pot(b, p) {
    if (p == 0) {
        return 1;
    }

    return b * pot(b, p - 1);
}

console.log(pot(2, 1000));

function pot(b, p) {
    let r = 1;
    while (p > 0) {
        r = b * r;
        p = p - 1;
    }
    return r;
}

console.log(pot(2, 1000));

function pot(b, p, a) {
    if (p == 0) {
        return a;
    }
    return pot(b, p - 1, b * a);
}

console.log(pot(2, 3, 1));
