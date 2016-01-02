#lang racket
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a)
                 result))))
  (iter a 1))

(define (factorial n)
  (define (inc n)
    (+ n 1))
  (product + 1 inc n))

(define (compute-pi n)
  (define (inc a)
    (+ a 1))
  (define (term a)
    (define denominator
      (+ 1 (* 2 a)))
    (/ (* (* 2 a)
          (+ (* 2 a) 2))
       (* denominator
          denominator)))
  (* 4.0
     (product-iter term 1 inc n)))

(factorial 10)
(compute-pi 10000)