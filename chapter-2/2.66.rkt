#lang racket
(define (element-of-set? x set)
  (cond [(null? set)
         #f]
        [(= x (entry set))
         set]
        [(< x (entry set))
         (element-of-set? x (left-branch set))]
        [(> x (entry set))
         (element-of-set? x (right-branch set))]))