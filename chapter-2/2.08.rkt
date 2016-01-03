#lang racket
(require "2.07.rkt")
(provide (all-defined-out))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

