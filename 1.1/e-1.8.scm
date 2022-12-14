;; Cube Root
(define (improve-cube guess x)
  (/
    (+ (/ x (square guess)) (* 2 guess))
    3))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) .000000000000001))

(define (cube-iter guess x)
  (if (good-enough-cube? guess x)
    guess
    (cube-iter (improve-cube guess x)
               x)))

(define (cube-root x)
  (cube-iter 1.0 x))

(cube-root 27)
