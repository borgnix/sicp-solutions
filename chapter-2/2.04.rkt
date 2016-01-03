#lang racket
(define (cons x y)
  (lambda(m) (m x y)))

(define (car z)
  (z (lambda(p q) p)))

;To verify (car (cons x y)) yields x, we substitute definiton for procedure step by step,
;(car (cons x y))
;(car (lambda (m) (m x y)))
;((lambda(m)(m x y)) (lambda(p q) p))
;((lambda(p q) p) x y)
;x

(define (cdr z)
  (z (lambda(p q) q)))

