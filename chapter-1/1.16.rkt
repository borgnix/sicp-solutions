#lang racket
(define (fast-expt-iterative b n)
  (define (iter b n product)
    (cond [(= n 0)  product]
          [(even? n) (iter (square b) (/ n 2) product)]
          [else
           (iter b (- n 1) (* product b))]))
  (iter b n 1))

(define (square x)
  (* x x))

(define (fast-expt b n)
(cond ((= n 0) 1)
((even? n) (square (fast-expt b (/ n 2))))
(else (* b (fast-expt b (- n 1))))))

(fast-expt 2 2)
(fast-expt-iterative 2 10)
     