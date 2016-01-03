#lang racket
(provide (all-defined-out))
(define make-point cons)
(define x-point car)
(define y-point cdr)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point (/
               (+ x-point (start-segment s)
                  y-point (end-segment s))
               2)
              (/
               (+ x-point (start-segment s)
                  y-point (end-segment s))
               2)))

