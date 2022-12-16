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

; TREE RECURSION

; "recursive iteration" example

(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1))
             (fib (- n 2))))))

;outer-most leaves (will always return 0 or 1)
(fib 0)
(fib 1)
;
; these create tree-like shapes
       (fib 3)
;      /      \
; + (fib 1)  (fib 2)
;            /     \
; +      (fib 1)   (fib 0)

(fib 3) ;=> 2

(fib 11)

; exponential time O(n^2)
;    NOT GOOD

(define god (/
              (+ 1 (sqrt 5))
              2))

(define (golden-ratio n)
  (/
    (expt god n)
    (sqrt 5)))

(golden-ratio 11)
(fib 11)

(golden-ratio 23)
(fib 23)

;There is a better way to calculate fib (recall: iterative processes)

(define (fib-iter n)
  (define (fib-loop a b count)
    (if (= count 0)
      b
      (fib-loop (+ a b) a (dec count))))
  (fib-loop 1 0 n))

(fib-iter 5)

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
