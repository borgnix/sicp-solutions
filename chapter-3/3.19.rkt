#lang racket
(define (contain-cycle? lst)
  (define (step lst n)
    (if (or (= n 0) (null? lst))
        lst
        (step (cdr lst) (- n 1))))
  (define (iter walker1 walker2)
    (let ((step-1 (step walker1 1))
          (step-2 (step walker2 2)))
      (cond [(or (null? step-1) (null? step-2)) #f]
            [(eq? step-1 step-2) #t]
            [else (iter walker1 walker2)])))
  (iter lst lst))
