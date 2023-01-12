#lang racket/base
(require racket/trace)

; (b ^ n/2) ^ 2
; ==
; (b ^ 2) ^ n/2

;keep along with n and b, an additional state variable a
;
;define the state such that (ab)^n is unchanged from state to stat
;at start, a is taken to be 1
;this is referred to as an invariate quantity (powerful in iterative recursion)

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-expt-iter-v a b n)
  (cond
    ((= n 0) a)
    ((even? n)
     (fast-expt-iter-v (square b) b (/ n 2)))
    (else
     (fast-expt-iter-v (* a b) b (- n 1)))))

(define (fast-expt-v a b)
  (fast-expt-iter-v a b 1))



(define (fast-expt-iter a b n)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter a (* b b) (/ n 2)))
        (else
         (fast-expt-iter (* a b) b (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(trace fast-expt-iter)
(fast-expt-iter 1 9 7)
