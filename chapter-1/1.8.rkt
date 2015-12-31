#lang racket
(define (cube-root x)
  (define (cr-iter last guess x)
    (if (good-enough-improved? last guess)
        guess
        (cr-iter guess (improve guess x) x)))
  (cr-iter x 1.0 x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (square x)
  (* x x))

(define (good-enough-improved? last guess)
  (< (abs (- guess last)) 0.0001))

(cube-root 9)