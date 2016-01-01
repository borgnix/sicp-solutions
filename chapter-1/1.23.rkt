#lang racket
(define (smallest-divisor n)
  (find-divisor n 2))

(define (smallest-divisor-improved n)
  (find-divisor-improved n 2))

(define (find-divisor n test-divisor)
  (cond [(> (square test-divisor) n) n]
        [(divides? n test-divisor) test-divisor]
        [else (find-divisor n (+ test-divisor 1))]))

(define (find-divisor-improved n test-divisor)
  (cond [(> (square test-divisor) n) n]
        [(divides? n test-divisor) test-divisor]
        [else (find-divisor n (next test-divisor))]))

(define (square x)
  (* x x))

(define (next x)
  (if (= 2 x)
      3
      (+ x 2)))

(define (divides? n x)
  (= (remainder n x) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (prime-improved? n)
  (= (smallest-divisor-improved n) n))

(define (timed-prime-test n)
  (time (prime? n)))

(define (timed-prime-improved-test n)
  (time (prime-improved? n)))

(timed-prime-test 1000000000039)
(timed-prime-improved-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-improved-test 1000000000061)
(timed-prime-test 1000000000063)
(timed-prime-improved-test 1000000000063)
;No, sometimes even slower