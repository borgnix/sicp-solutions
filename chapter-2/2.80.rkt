#lang racket
(put '=zero? 'scheme-number
     (lambda(x) (= x 0)))

(put '=zero? 'rational-number
     (lambda(x) (and (= numer 0)
                     (not (= denom 0)))))

(put '=zero? 'complex
     (lambda (x)
       (and (= (real-part x) 0)
            (= (imag-part y) 0))))

(define (=zero? x)
  (apply-generic '=zero? x))