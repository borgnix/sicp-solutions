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

(define (prime? n)
  (= (smallest-divisor n) n))

(define (find-smallest-prime-larger-than-x x)
  (if (prime? x)
      x
      (find-smallest-prime-larger-than-x (+ 1 x))))

(define (find-n-prime-larger-than-x n x)
  (define (iter n x)
    (newline)
    (display (- x 1))
    (if (= n 1)
        (find-smallest-prime-larger-than-x x)
        (iter (- n 1) (+ 1 (find-smallest-prime-larger-than-x x)))))
  (iter n x))

(define (timed-find-prime x)
  (time (find-n-prime-larger-than-x 3 x)))

(timed-find-prime 10000000000)
(timed-find-prime 100000000000)
(timed-find-prime 1000000000000)

;Yes, the sqrt(n) order prediction is right!