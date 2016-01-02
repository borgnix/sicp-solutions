#lang racket
(define (cont-frac n d k)
  (define (iter i)
    (let ((nk (n i))
          (dk (d i)))
      (if (> i k)
          dk
          (/ nk (+ dk
                   (iter (+ 1 i)))))))
  (iter 1))

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

(cont-frac (lambda(i) 1.0)
           (lambda(i) 1.0)
           1000)
(cont-frac-iter (lambda(i) 1.0)
           (lambda(i) 1.0)
           1000)