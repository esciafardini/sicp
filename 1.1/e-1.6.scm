;;Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond
    (predicate then-clause)
    (else else-clause)))

(define (sqr-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqr-iter2 (improve guess x) x)))

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
