#lang racket
(define (cont-frac-iter n d k)
  (define (iter i result)
    (let ((nk (n i))
          (dk (d i)))
      (if (= i 0)
          result
          (iter (- i 1)
                (/ nk
                   (+ dk result))))))
  (iter k (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac-iter (lambda(i)(if (= 1 i) x (- (* x x))))
                  (lambda(i)(- (* 2 i) 1))
                  k))

(tan-cf 0 1000)