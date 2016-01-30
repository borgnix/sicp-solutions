#lang racket
(define (adjoin-set x set)
  (define (iter list)
    (cond [(null? list)
           (cons x set)]
          [(= x (car list))
           list]
          [(> x (car list))
           (cons (car list) (cons x (cdr list)))]
          [else
           (cons (car list) (adjoin-set x (cdr set)))]))
  (iter set))
