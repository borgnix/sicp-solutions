#lang racket
(define (f n)
  (let ((x 1))
    (if (= n 0)
        (begin (set! x 0)
               x)
        x)))