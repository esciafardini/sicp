;; Exercise 1.7


(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .0000000000001))

(define (improve-square guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve-square guess x)
               x)))

(define (sqrrt x) (sqrt-iter 1.0 x))
(sqrrt 4)

(sqrt 12345678901234)


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
(new-sqrt 4) ;weird, inaccurate
(new-sqrt 8359079184) ;;good, accurate
