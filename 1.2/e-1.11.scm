; if n < 3
; f(n) = n

; if n >= 3
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)

;recursive ver:
(define (recursive-ver n)
  (if (< n 3)
    n
    (+ (recursive-ver (- n 1))
       (* 2 (recursive-ver (- n 2)))
       (* 3 (recursive-ver (- n 3))))))

(recursive-ver 4)
(recursive-ver 5)
(recursive-ver 6)


;iterative ver:
(define (iterative-ver n)
  ;add a count
  (if (< n 3)
    n
    iterative-ver 2 + 2 + 0
    ))


; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3)
4

f (3) +
  2 * f (1) +
  3 * f (2)


f (3)
= f(2) + 2f(1) + 3f(0)
= 2 + 2 + 0

  +
  2 * 1 +
  3 * 2

(+ 3 3 6)

(define (f n)
  (if (< n 3)
    n
    (f-iter 0 1 2 (- n 2))))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
