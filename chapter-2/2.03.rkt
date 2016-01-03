#lang racket
(require "2.02.rkt")
(make-point 2 3)

(define make-rectangle cons)
(define segment-1 car)
(define segment-2 cdr)

(define (perimeter r)
  (* 2
     (+
      (length (segment-1 r))
      (length (segment-2 r)))))

(define (area r)
  (* (length (segment-1 r))
     (length (segment-2 r))))

;with dirrent definition, we can just provide segment-1 and segment-2 operation.