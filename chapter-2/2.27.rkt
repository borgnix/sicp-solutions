#lang racket
(define (deep-reverse items)
  (define (iter list-items result)
    (cond [(null? list-items) result]
          [(pair? (car list-items))
           (iter (cdr list-items)
                 (cons (deep-reverse (car list-items)) result))]
          [else
           (iter (cdr list-items)
                 (cons (car list-items) result))]))
  (iter items '()))

(define x (list (list (list 3 4) 2) (list 3 4)))
x
(deep-reverse x)