#lang racket/base
(require racket/trace)

(define (times a b)
  (if (= b 0)
    0
    (+ a (times a (- b 1)))))
