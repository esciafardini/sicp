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







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;Page 40;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; COUNTING CHANGE ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; this still feels like sorcery

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

(cc 11 5)

;;
;;
;;....ANYWAYS....
;;
;;
;; 1.2.4 Exponentiation

; a linear `recursive` process:
(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))
;O(n) space & O(n) time complexity

; a linear `iterative` version:
;;;; Generally, has a counter
;;;; along with an accumulator

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b (- counter 1) (* b product))))

(define (expt-v2 b n)
  (expt-iter b n 1))
;O(1) space & O(n) time complexity

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-exponent b n)
  (cond
    ((= n 0) 1)
    ((even? n)
     (square (fast-exponent b (/ n 2))))
    (else
      (* b (fast-exponent b (- n 1))))))
