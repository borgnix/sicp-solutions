#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
        [(divides? n test-divisor) test-divisor]
        [else (find-divisor n (+ test-divisor 1))]))

(define (square x)
  (* x x))

(define (divides? n x)
  (= (remainder n x) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)