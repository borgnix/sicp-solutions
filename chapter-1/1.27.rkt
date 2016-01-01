#lang racket
(define (expmod base exp m)
  (cond [(= exp 0) 1]
        [(even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m)]
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (square x)
  (* x x))

(define (carmichael? n)
  (define (fermat? a)
    (= (expmod a n n) a))
  (define (iter a)
    (cond [(= a n) #t]
          [(fermat? a) (iter (+ a 1))]
          [else
           #f]))
  (iter 1))

(carmichael? 561)
(carmichael? 1105)