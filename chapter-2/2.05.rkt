#lang racket
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car sum)
  (define (iter result n)
    (if (= (remainder n 2) 0)
        (iter (+ result 1) (/ n 2))
        result))
  (iter 0 sum))


(define (cdr sum)
  (define (iter result n)
    (if (= (remainder n 3) 0)
        (iter (+ result 1) (/ n 3))
        result))
  (iter 0 sum))


(car (cons 3 2))
(cdr (cons 3 2))