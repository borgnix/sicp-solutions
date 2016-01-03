#lang racket
(require "2.07.rkt")
(require "2.08.rkt")
(provide (all-defined-out))
(define (div-interval x y)
  (let ((ly (lower-bound y))
        (uy (upper-bound y)))
    (if (and (<= ly 0) (>= uy 0))
        (error "divided by a interval spaning zero")
        (mul-interval
         x
         (make-interval (/ 1.0 (upper-bound y))
                        (/ 1.0 (lower-bound y)))))))


