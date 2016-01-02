#lang racket
;Simpson's Rule
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define h
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (next k)
    (+ 1 k))
  (define (term k)
    (cond [(or (= k 0) (= k n)) (y k)]
          [(even? k) (* 2 (y k))]
          [else (* 4 (y k))]))
  (* (/ h 3)
     (sum term 0 next n)))

(define (cube x)
  (* x x x))

(integral cube 0 1 100)
(integral cube 0 1 1000)