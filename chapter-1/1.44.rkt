#lang racket
(define dx 0.0000001)
(define (smooth f)
  (lambda(x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))

(define (repeated-smooth f n)
  (repeated (smooth f) n))