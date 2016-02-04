#lang racket
(define (contain-cycle? lst)
  (let ((encountered '()))
    (define (iter lst)
      (cond [(null? lst) #f]
            [(memq lst encounted) #t]
            [else (begin (set! encountered (cons lst encountered))
                         (iter (cdr lst)))]))
    (iter lst)))