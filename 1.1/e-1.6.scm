;;Exercise 1.6

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .0001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
  (cond
    (predicate then-clause)
    (else else-clause)))

(define (sqr-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqr-iter2 (improve guess x) x)))


(define (sqr-iter-works guess x)
  (cond ((good-enough? guess x)
         guess)
        (else (sqr-iter-works (improve guess x) x))))

(sqr-iter2 3 16)

;;why doesn't this work?

;; since new-if is evaluated applicative order style - it will never short circuit, even when guess is 'good enough'
;;  new-if is a procedure
;;  All sub-expressions are evaluated before new-if is applied to the values of the operands (scheme by design performs Applicative Order Evaluation)

(define (if-it-aint-broke)
  (if true
    9
    (infinite)))

(define (break-it)
  ;; not a special form (like if & cond)
  (new-if true
          9
          (infinite)))

;(break-it)
(if-it-aint-broke)
