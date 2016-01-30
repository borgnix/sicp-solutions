#lang racket
(provide union)
(define (union set1 set2)
  (cond [(null? set1)
         set2]
        [(null? set2)
         set1]
        [(< (car set1) (car set2))
         (cons (car set1) (union (cdr set1) set2))]
        [(> (car set1) (car set2))
         (cons (car set2) (union set1 (cdr set2)))]
        [else
         (union (cdr set1) set2)]))

(define set1
  (list 1 2 3 4 5 8 9))

(define set2
  (list 1 2 3 4 5 6 7 12 34 556))

