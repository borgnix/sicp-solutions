#lang racket
(require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))
(provide (all-defined-out))
(define box
  (segments->painter
   (list (make-segment
          (make-vect 0 0)
          (make-vect 0 1))
         (make-segment
          (make-vect 0 0)
          (make-vect 1 0)))))

;(paint box)

(define cross
  (segments->painter
   (list (make-segment
          (make-vect 0 0)
          (make-vect 1 1))
         (make-segment
          (make-vect 0 1)
          (make-vect 1 0)))))

;(paint cross)

(define diamond
  (segments->painter
   (list (make-segment
          (make-vect 0.5 0)
          (make-vect 0 0.5))
         (make-segment
          (make-vect 0.5 0)
          (make-vect 1 0.5))
         (make-segment
          (make-vect 0 0.5)
          (make-vect 0.5 1))
         (make-segment
          (make-vect 1 0.5)
          (make-vect 0.5 1)))))

;(paint diamond)

