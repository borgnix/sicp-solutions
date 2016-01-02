#lang racket
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point-average f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
            tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (average guess (f guess))))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (f x)
  (/ (log 1000) (log x)))

(fixed-point f
             2)

(fixed-point-average f
                     2)
    