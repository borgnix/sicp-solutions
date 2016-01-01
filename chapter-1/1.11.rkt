#lang racket
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f-iter f-n-1 f-n-2 f-n-3 count)
    (if (= 0 count)
        f-n-3
        (f-iter (+ f-n-1 (* 2 f-n-2) (* 3 f-n-3))
                f-n-1
                f-n-2
                (- count 1))))
  (if (< n 3)
      n
      (f-iter 0 1 2 n)))

(f-recursive 4)
(f-iterative 4)
