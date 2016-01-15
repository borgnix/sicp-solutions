#lang racket
(define (element-of-set? x set)
  (cond [(null? set)
         #f]
        [(equal? (car set) x)
         #t]
        [else
         (element-of-set? x (cdr set))]))

(define (adjoin-set x set)
      (cons x set))

(define (insection-of-sets set1 set2)
  (cond [(or (null? set1) (null? set2)) '()]
        [(element-of-set? (car set2) set1)
         (cons (car set2) (insection-of-sets set1 (cdr set2) ))]
        [else
         (insection-of-sets set1 (cdr set2))]))

(define (union-of-sets set1 set2)
  (cond [(null? set2)
         set1]
        [else
         (cons (car set2) (union-of-sets set1 (cdr set2)))]))

(element-of-set? 'x (adjoin-set 'x '()))

(element-of-set? 'x '())

(insection-of-sets '(1 3 x 4 5) '(1 3 2 x))

(union-of-sets '(1 3 x 4 5) '(1 3 2 x))
