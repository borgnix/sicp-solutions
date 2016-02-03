#lang racket
(put 'sin 'integer sin)
(put 'cos 'integer cos)
(put 'sin 'rational (lambda (x) (sin (/ (numer (contents x) (denom (contents x)))))))
(put 'cos 'rational (lambda (x) (cos (/ (numer (contents x)) (denom (contents x))))))
(put 'sin 'real (lambda (x) (sin (contents x))))
(put 'cos 'real (lambda (x) (cos (contents x))))

(put 'real-part 'polar
     (lambda(x)
       (* ((get 'magnitude 'polar) x)
          ((get 'cos (type-tag x))  ((get 'angle 'polar) x)))))

(put 'imag-part 'polar
     (lambda(x)
       (* ((get 'magnitude 'polar) x)
          ((get 'sin (type-tag x))  ((get 'angle 'polar) x)))))


(put 'magnitude 'rectangle
     (lambda (x)
       (sqrt (+ (square ((get 'real-part rectangle) x))
                (square ((get 'imag-part rectangle) x))))))

(put 'magnitude 'rectangle
     (lambda (x)
       (atan (/ ((get 'real-part rectangle) x)
                ((get 'imag-part rectangle) x)))))



