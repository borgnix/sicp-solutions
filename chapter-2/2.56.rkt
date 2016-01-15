#lang racket
(provide (all-defined-out))

(define (deriv exp var)
  (cond [(number? exp)
         0]
        [(variable? exp)
         (if (same-variable? exp var)
             1
             0)]
        [(sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var))]
        [(product? exp)
         (make-sum (make-product (deriv (multiplier exp) var)
                                 (multiplicand exp))
                   (make-product (deriv (multiplicand exp) var)
                                 (multiplier exp)))]
        [(expt? exp)
         (make-product (make-product (exponent exp)
                                     (make-expt (base exp) (- (exponent exp)
                                                              1)))
                       (deriv (base exp) var))]
        [else
         (error "unsupported deriv type" exp)]))


(define variable? symbol?)

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define addend cadr)

(define augend caddr)

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define multiplier cadr)

(define multiplicand caddr)

(define (make-product a b)
  (cond [(=number? a 1) b]
        [(=number? b 1) a]
        [(or (=number? a 0)
             (=number? b 0))
         0]
        [(and (number? a)
              (number? b))
         (* a b)]
        [else
         (list '* a b)]))

(define (make-sum a b)
  (cond [(=number? a 0) b]
        [(=number? b 0) a]
        [(and (number? a)
              (number? b))
         (+ a b)]
        [else
         (list '+ a b)]))

(define (=number? a b)
  (and (number? a) (= a b)))

(define ** expt)

(define (expt? x)
  (and (pair? x) (eq? (car x) '**)))

(define (make-expt a b)
  (cond [(=number? b 0)
         1]
        [(=number? b 1)
         a]
        [(=number? a 0)
         0]
        [(=number? a 1)
         1]
        [else
         (list '** a b)]))

(define base cadr)

(define exponent caddr)
