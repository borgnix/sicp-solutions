#lang racket
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define addend car)

(define augend caddr)

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define multiplier car)

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
         (list a '* b)]))

(define (make-sum a b)
  (cond [(=number? a 0) b]
        [(=number? b 0) a]
        [(and (number? a)
              (number? b))
         (+ a b)]
        [else
         (list a '+ b)]))



