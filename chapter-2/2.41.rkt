#lang racket
(require "2.40.rkt")

(define (unique-triples n)
  (flatmap (lambda(i)
             (flatmap (lambda(j)
                    (map (lambda(k)
                           (list i j k))
                         (range 1 j)))
                  (range 1 i)))
           (range 1 n)))

(define (sum-s-triples s n)
  (define (sum-equal-to-s? list)
    (= s
       (foldr + 0 list)))
  (filter sum-equal-to-s? (unique-triples n)))

(sum-s-triples 10 10)
