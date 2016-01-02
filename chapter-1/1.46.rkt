#lang racket
(define (iterative-improve close-enough? improve)
  (lambda(first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess)))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda(v1 v2)
                       (< (abs (- v1 v2)) 0.00001))
                     f)
   first-guess))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average a b)
  (/ (+ a b) 2))


(define (sqrt x)
  (fixed-point (average-damp (lambda (y)
                               (/ x y))) 1.0))

(sqrt 2)