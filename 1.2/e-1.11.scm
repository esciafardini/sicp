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

;Space complexity = Time complexity
; O(n)

;not so hot for larger inputs

;iterative ver:
(define (f n)
  (if (< n 3)
    n
    (f-iter 0 1 2 (- n 2))))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

;Space complexity is significantly less in the iterative solution
; O(1)
;Time complexity is the same
; O(n)
;
;This is because memory is not being allocated at each step for delayed evaluation

(f 100)
