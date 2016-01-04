#lang racket
(require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1)))
(require "2.50.rkt")
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           ((transform-painter
             (make-vect 0.0 0.0)
             split-point
             (make-vect 0.0 1.0))
            painter1))
          (paint-right
           ((transform-painter
             split-point
             (make-vect 1.0 0.0)
             (make-vect 0.5 1.0))
            painter2)))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-down
           ((transform-painter
             (make-vect 0 0.0)
             (make-vect 1.0 0.0)
             split-point)
            painter1))
          (paint-right
           ((transform-painter
             split-point
             (make-vect 1.0 0.5)
             (make-vect 0 1.0))
            painter2)))
      (lambda (frame)
        (paint-down frame)
        (paint-right frame)))))

(define (below-com painter1 painter2)
  (flip-180 (flip-270 (beside (flip-270 painter1) (flip-270 painter2)))))

(paint (below-com einstein einstein))