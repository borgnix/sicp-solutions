#lang racket
(define (same-parity . l)
  (let ((parity (remainder (car l) 2)))
    (define (iter items)
      (cond [(null? items)
             '()]
            [(= parity (remainder (car items) 2))
             (cons (car items) (iter (cdr items)))]
            [else
             (iter (cdr items))]))
    (iter l)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)