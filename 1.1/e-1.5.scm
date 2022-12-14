;;Exercise 1.5
(define (infinite) (infinite))  ;;this fn will call itself forever if called

(define (test x y)
  (if (= x 0)
    0
    y))

;; the following returns 777 becuz if is a special form (not applicative-order style)
(if (= 0 0)
  777
  (infinite))

;; the following would recurse infinitely because procedure calls in MIT Scheme use applicative-order evaluation (all expressions are evaluated immediately)
;  (test (= 0 0) 777 (infinite))

