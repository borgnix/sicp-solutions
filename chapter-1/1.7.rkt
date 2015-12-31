#lang racket
(define (sqrt x)
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

(define (sqrt-improved x)
  (define (sqrt-iter last guess x)
    (if (good-enough-improved? last guess)
        guess
        (sqrt-iter guess (improve guess x) x)))
  (sqrt-iter x 1.0 x))

(define (good-enough-improved? last guess)
  (< (abs (- guess last)) 0.001))

(time (sqrt 0.00000000000001))
(time (sqrt-improved 0.00000000000001))


(time (sqrt-improved 1234567891011121314))
(time (sqrt 1234567891011121314))
