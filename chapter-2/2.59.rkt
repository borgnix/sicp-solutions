#lang racket
(define (element-of-set? x set)
  (cond [(null? set)
         #f]
        [(equal? (car set) x)
         #t]
        [else
         (element-of-set? x (cdr set))]))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (insection-of-sets set1 set2)
  (cond [(or (null? set1) (null? set2)) '()]
        [(element-of-set? (car set2) set1)
         (cons (car set2) (insection-of-sets set1 (cdr set2) ))]
        [else
         (insection-of-sets set1 (cdr set2))]))

(define (union-of-sets set1 set2)
  (cond [(null? set2)
         set1]
        [(element-of-set? (car set2) set1)
         (union-of-sets set1 (cdr set2))]
        [else
         (cons (car set2) (union-of-sets set1 (cdr set2)))]))
