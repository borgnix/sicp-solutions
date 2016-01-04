#lang racket
(require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))
(require "2.49.rkt")
(provide (all-defined-out))

(define flip-horizon
  (transform-painter (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define flip-180
  (transform-painter (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

(define flip-270
  (transform-painter (make-vect 1 0)
                     (make-vect 1 1)
                     (make-vect 0 0)))

;(paint einstein)
;(paint (flip-horizon einstein))
;(paint (flip-180 einstein))
;(paint (flip-270 einstein))

