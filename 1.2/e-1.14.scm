(define (highest-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)    ;pennies
        ((= kinds-of-coins 2) 5)    ;nickels
        ((= kinds-of-coins 3) 10)   ;dimes
        ((= kinds-of-coins 4) 25)   ;quarters
        ((= kinds-of-coins 5) 50))) ;50 cent pieces

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc
                   (- amount
                      (highest-denomination kinds-of-coins))
                   kinds-of-coins)))))

(define (count-change amount)
  (cc amount 5))

(count-change 11)

;A pattern emerges
;when amount is less than one 0.50 (fifty cent piece) or any other piece,
;cc returns 0 each time it's called in the `else` block

(cc 11 5)

;FIRST ITERATION
;;;;

(+ (cc 11 4)   ;all the ways to count change for 11 cents with 4 kinds of coins (pennies, nickels, dimes, quarters)
   (cc -45 5)) ;all the ways to count change for -45 cents with 5 kinds of coins (arbitrary, always 0)

(+ (cc 11 4) 0)

(cc 11 4)

;SECOND ITERATION
;;;;

(cc 11 4)

(+ (cc 11 3)
   (cc -14 4))

(+ (cc 11 3)
   0)

(cc 11 3)

;THIRD ITERATION
;;;;

(cc 11 3)

(+ (cc 11 2) ;all the ways to count change for 11 cents with two kinds of coins.... (pennies and nickels)
   (cc 1 3)) ;all the ways to count change for 1 cent with 'three' different kinds of coins (aribitrary)

(+ (+ (cc 11 1)
      (cc 6 2))
   (+ (cc amount (- kinds-of-coins 1))
      (cc
        (- amount
           (highest-denomination kinds-of-coins))
        kinds-of-coins)))


;O(n^5) growth in time complexity
;&& linear O(n) in space complexity
