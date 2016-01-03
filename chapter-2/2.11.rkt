#lang racket
(require "2.07.rkt")

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (let ((lx (lower-bound x))
          (ly (lower-bound y))
          (ux (upper-bound x))
          (uy (upper-bound y)))
      (cond [(and (>= lx 0) (>= ly 0) (>= ux 0) (>= uy 0))
             (make-interval p1 p4)]
            [(and (>= lx 0) (>= ux 0) (< ly 0) (>= uy 0))
             (make-interval p3 p4)]
            [(and (>= lx 0) (>= ux 0) (< ly 0) (< uy 0))
             (make-interval p3 p2)]
            [(and (< lx 0) (>= ux 0) (>= ly 0) (>= uy 0))
             (make-interval p2 p4)]
            [(and (< lx 0) (< ux 0) (>= ly 0) (>= uy 0))
             (make-interval p2 p3)]
            [(and (< lx 0) (>= ux 0) (< ly 0) (>= uy 0))
             (make-interval (min p2 p3) (max p1 p4))]
            [(and (< lx 0) (>= ux 0) (< ly 0) (< uy 0))
             (make-interval p1 p2)]
            [(and (< lx 0) (< lx 0) (< ly 0) (>= uy 0))
             (make-interval p2 p1)]
            [(and (< lx 0) (< lx 0) (< ly 0) (< uy 0))
             (make-interval p4 p1)])))) 
             
