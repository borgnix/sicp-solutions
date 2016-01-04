#lang racket
(define (last-pair i)
  (if (null? (cddr i))
      (cdr i)
      (last-pair (cdr i))))

(last-pair (list 23 72 149 34))