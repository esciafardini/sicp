;; Chapter 1.1
;; Abstractions

;; simplest means of abstraction
;; Names that refer to values
(define x 9)
(define y 20)
(+ x y)

;; Predicate fn resolves to true or false

;; Procedure definitions:
(define (square x) (* x x))
(square 9)

(define (cube x) (* x x x))
(cube 4)

(define (abs x)
  (cond
    ((= x 0) 0)
    ((< x 0) (- x))
    (else x)))

;;SQUARE ROOT
(define (average x y)
  (/ (+ x y) 2))

(define (improve-square guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) .0001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve-square guess x)
               x)))

(square .000001)

;inaccurate
(good-enough? .00000118321 .000000000014)

(square 123125235123)
(good-enough?
  123125235123
  15159823524094032825129)

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)
(sqrt 4)
(sqrt 8359079184) ;;good, accurate

(= .00000000000000001
   (square (sqrt .00000000000000001)))

(square (sqrt 8359079183323112123234))

;; parameters are local to the bodies of their respective procedures
(define (sqr x) (* x x))
(define (cb x) (* x x x))
;; Not the same x! bound variable x (procedure binds its formal parameters)

;;SCOPE
; procedure (defined within a procedure)
; free (I guess <, >, abs, + are considered 'free'?)
j
; lexical scoping: dictates that free variables in a procedure
; are taken to refer to bindings made by enclosing procedure definitions

;Localized (lexical scoping) version of sqrt:
(define (sqrt-scoped x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .000000000000000001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt-scoped 3)

; Man's question in class (procedure vs. variable)
(define a (* 5 5))
(define (b) (* 5 5))
a
(b)
