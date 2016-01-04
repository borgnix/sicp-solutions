#lang racket
(require "2.33.rkt")
(define (count-leaves t)
  (accumulate + 0 (map (lambda(tree)
                         (if (pair? tree)
                             (count-leaves tree)
                             1))
                       t)))


(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)  