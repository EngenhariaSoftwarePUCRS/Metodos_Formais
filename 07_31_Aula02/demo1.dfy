function pot2(n: nat): nat {
    if n == 0
    then 1
    else 2 * pot2(n - 1)
}

method fazalgo(n: nat) returns (r: nat)
    ensures r == pot2(n) {
        r := 1;
        // while n > 0:
        //     r = r * 2
        //     n = n - 1

        var i := 0;
        while i < n
            invariant 0 <= i <= n
            invariant r == pot2(i)
        {
            r := 2 * r;
            i := i + 1;
        }
    }
