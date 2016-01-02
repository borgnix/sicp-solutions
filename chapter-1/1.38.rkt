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



(define (compute-e k)
  (define (divided-by-three? n)
    (= (remainder n 3) 0))
  (+ 2
     (cont-frac-iter (lambda(i)1.0)
                     (lambda(i)
                       (if (divided-by-three? (+ i 1))
                           (* 2 (/ (+ i 1) 3))
                           1))
                     k)))

(compute-e 1000)
