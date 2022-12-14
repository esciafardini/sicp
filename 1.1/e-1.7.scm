;; Exercise 1.7

;; try a version that tests against the last guess
(define (new-good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess x)
    guess
    (sqrt-iter (improve-square guess x)
               x)))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

;;still sucks
(new-sqrt 4) ;weird, inaccuate
(new-sqrt 8359079184) ;;good, accurate
