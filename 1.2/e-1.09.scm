#lang sicp
;Exercise 1.9

;Illustrate and identify as
; a. iterative
; b. recursive

(define (inc x) (+ 1 x))
(define (dec x) (- x 1))

(define (recursive-plus a b)
  (if ( = a 0)
    b
    (inc (recursive-plus (dec a) b))))

(recursive-plus 4 3)
(inc (recursive-plus 3 3))
(inc (inc (recursive-plus 2 3)))
(inc (inc (inc (recursive-plus 1 3))))
(inc (inc (inc (inc (recursive-plus 0 3)))))
(inc (inc (inc (inc 3))))
;=> 7
;
; This is a recursive process (b.)


(define (recursive-plus-v2 a b)
  (if (= a 0)
    b
    (recursive-plus-v2 (dec a) (inc b))))

(recursive-plus-v2 4 3)
(recursive-plus-v2 3 4)
(recursive-plus-v2 2 5)
(recursive-plus-v2 1 6)
(recursive-plus-v2 0 7)
; => 7
;
; This is an iterative process (a.)
