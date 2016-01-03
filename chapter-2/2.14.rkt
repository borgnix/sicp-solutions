#lang racket
(require "2.07.rkt")
(require "2.08.rkt")
(require "2.12.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one (add-interval (div-interval one r1)
                       (div-interval one r2)))))

(define test1
  (make-center-percent 5 0.01))

(define test2
  (make-center-percent 3 0.01))

(par1 test1 test2)
(par2 test1 test2)