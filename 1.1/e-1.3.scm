;;Exercise 1.3
(define (add-em x y z)
  (cond
    ((and (< x y) (< x z)) (+ (square y) (square z)))
    ((and (< z x) (< z y)) (+ (square y) (square x)))
    (else (+ (square x) (square z)))))

;;Exercise 1.3 - Attempt #2:
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-max-two x y z)
  (cond
    ((= x (min x y z)) (sum-of-squares y z))
    ((= y (min x y z)) (sum-of-squares x z))
    (else  (sum-of-squares y x))))

(sum-of-squares-max-two 3 4 5)
