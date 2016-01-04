#lang racket
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda(x)
                            (cons (car s) x))
                          rest)))))

(subsets '(1 2 3))

;last line divide subset into two parts: one contains (car s), and one doesn't.