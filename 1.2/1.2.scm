;RECURSION

; A Linear Recursive process
; built up of Deferred Operations
(define (factorial x)
  (if  (= x 1)
    x
    (* x (factorial (- x 1)))))

(factorial 5)

; An Iterative process
; fixed number of state variables (counter, product)
; This is a Linear Iterative Process
(define (factorial-iterative x)
  (define (iter product counter)
    (if (> counter x)
      product
      (iter (* product counter)
            (+ counter 1))))
  (iter 1 1))

(factorial-iterative 4)

;SYNTACTIC DISTINCTION:
; Recursive Procedure: one that calls itself
;
; Recursive *Process* vs. Iterative *Process*
;refers to how the process evolves in a Recursive Procedure

; Recursive Process
; built up of deferred operations, no 'state' variables

; Iterative Process
; state variables maintained and tracked @ each step

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; Exercise 1.9
; Are these processes iterative or recursive?
(define (plus a b)
  (if (= a 0)
    b
    (inc (plus (dec a) b))))
; ^ Recursive process
(plus 4 5)
(inc (plus 3 5))
(inc (inc (plus 2 5)))
(inc (inc (inc (plus 1 5))))
(inc (inc (inc (inc (plus 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
; => 9


(define (plus-again a b)
  (if (= a 0)
    b
    (plus-again (dec a) (inc b))))
; ^ Iterative process
(plus-again 4 5)
(plus-again 3 6)
(plus-again 2 7)
(plus-again 1 8)
(plus-again 0 9)
; => 9

;Exercise 1.10
; Ackerman's Function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 (A 0 (A 1 8)))
(* 2 (* 2 (A 0 (A 1 7))))
(* 2 (* 2 (* 2 (A 0 (A 1 6)))))
(* 2 2 2 2 2 2 2 2 2 2)

; A means of computing binary exponents

(A 2 4)
(A 3 3)

(define (f n) (A 0 n))
; 2n

(define (g n) (A 1 n))
; 2^n

(define (h n) (A 2 n))
; 2^h(n-1)

(define (k n) (* 5 n n))
; 5(n^2)

; TREE RECURSION
; multiple recursive calls at each branch?

; "recursive iteration" example

(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1))
             (fib (- n 2))))))

; exponential time O(n^2)
;    NOT GOOD


;; "linear iteration" example

(define (fib-iter a b count)
  (if (= count 0)
    b
    (fib-iter (+ a b) a (- count 1))))

(define (fib2 n)
  (fib-iter a b count))

; linear time O(n)
;   way better

;;;;;; COUNTING CHANGE ;;;;;;;;
;How many different ways can we make change of $1.00 (100)
; given
;  half dollars (50)
;  quarters (25)
;  dimes (10)
;  nickels (5)
;  pennies (1)

; *RE-VISIT*
; let's say 10 cents is your change
; 1 dime
; 2 nickels
; 1 nickel, 5 pennies
; 10 pennies
; =
; 4 ways

; that is the crux of this problem


; consider:
; (d) as the denomination of the first kind of coin
;
;
; number of ways to change amount (a)
; using (n) kinds of coins
; =
; number of ways to change amount (a) using all but the first kind of coin
; +
; number of ways to change amount a
; -
; (d) using all (n) kinds of coins


; Counting Change
;
; if a = 0 : there is 1 way to make change
; if a <= 0 : there are 0 ways to make change
; if n = 0 : there are 0 ways to make change

; takes the number of coins available,
; returns the denomination of the first kind
(define (first-denomination kinds-of-coins)
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
                   (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (count-change amount)
  (cc amount 5))

(count-change 10)

(define square (lambda (x) (* x x)))
(square 9)
