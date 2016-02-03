#lang racket
(put 'raise 'integer (lambda (x)
                       (make-rational x 1)))

(put 'raise 'rational (lambda(x)
                        (make-real (/ (numer x) (denom x)))))

(put 'raise 'real (lambda (x)
                    (make-complex x 0)))

