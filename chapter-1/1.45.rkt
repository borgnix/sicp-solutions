#lang racket
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= 1 n)
      f
      (compose f (repeated f (- n 1)))))


(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))


(define (sqrt x)
  (fixed-point (average-damp (lambda (y)
                               (/ x y))) 1.0))
(sqrt 2)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y)
                               (/ x (* y y)))) 1.0))

(cube-root 8)

(define (4-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y)
                               (/ x (* y y y)))) 1.0))
(4-root 16)

(define (5-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y)
                               (/ x (* y y y y)))) 1.0))
(5-root 32)

(define (6-root x)
  (fixed-point ((repeated average-damp 2) (lambda (y)
                               (/ x (* y y y y y)))) 1.0))
(6-root 64)

