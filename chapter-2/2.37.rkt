#lang racket
(require "2.36.rkt")
(require "2.33.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda(row)
         (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(row)
           (matrix-*-vector cols row))
         m)))

(define v (list 1 3 -5))
(define w (list 4 -2 -1))
(dot-product v w)
(define m (list (list 1 2 3) (list 4 5 6)))
(define z (list 1 2 3))
(matrix-*-vector m z)
(define a (list (list 14 9 3) (list 2 11 15) (list 0 12 17) (list 5 2 3)))
(define b (list (list 12 25) (list 9 10) (list 8 5)))
(matrix-*-matrix a b)
