#lang racket
(define (filtered-accumulate filter combiner null-value term a next b)
  (cond [(> a b) null-value]
        [(filter a) (combiner (term a)
                (filtered-accumulate filter combiner null-value term (next a) next b))]
        [else (filtered-accumulate filter combiner null-value term (next a) next b)]))

; This Program can not run without procedure prime? and relatively-prime?

(define (prime-sum a b)
  (filtered-accumulate prime? + 0 + a inc b))

(define (relative-prime-product n)
  (define (rp? a)
    (relative-prime? a n))
  (filtered-accumulate rp? * 1 + 1 inc n))


      