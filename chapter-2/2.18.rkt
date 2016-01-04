#lang racket
(define (reverse items)
  (define (iter list-items result)
    (if (null? list-items)
        result
        (iter (cdr list-items) (cons (car list-items) result))))
  (iter items '()))

(reverse (list 1 4 9 16 25))