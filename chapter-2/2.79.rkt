#lang racket
(put 'equ? '(scheme-number)
     (lambda (x y)
       (= x y)))

(put 'equ? '(rational-number)
     (lambda (x y)
       (and (= (numer x) (numer y))
            (= (denom x) (denom y)))))

(put 'equ? '(complex)
     (lambda (x y)
       (and (= (real-part x) (real-part y)
               (imag-part x) (imag-part y)))))

(define (equ? x y) (apply-generic 'equ? x y))

