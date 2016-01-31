#lang racket
(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp)
         (if (same-variable? exp var 1) 1 0)]
        [else ((get 'deriv (operator exp))
               (operands exp) var)]))

(define (operator exp) (car exp))
(define (operand exp) (cdr exp))

(define (install-sum-deriv-method)
  (define (sum-deriv exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'deriv '+ sum-deriv)
  ('done))

(define (install-product-deriv-methode)
  (define (deriv exp var)
    (make-sum (make-product
               (multiplier exp)
               (deriv (multiplicand exp)))
              (make-product
               (deriv (multiplier exp) var)
               (multiplicand exp))))
  (put 'deriv '* deriv)
  ('done))

;1.because number? and variable? checks whether the argument is a symbol, they can't be put in the table.
;we need to change put procedure.

