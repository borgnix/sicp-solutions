#lang racket
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (cond [(= b 0) 0]
        [(even? b) (* (double a) (halve b))]
        [else (+ (* a (- b 1)) a)]))

(* 5 6);30