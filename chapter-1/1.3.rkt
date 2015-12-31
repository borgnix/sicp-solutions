#lang racket
(define (f a b c)
  (if (> a  b)
      (+ (square a) (square (max b c)))
      (+ (square b) (square (max a c)))))

(define (square x)
  (* x x))