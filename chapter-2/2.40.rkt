#lang racket
(require "2.33.rkt")
(provide (all-defined-out))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval a b)
  (if (> a b)
      '()
      (cons a
            (enumerate-interval (+ 1 a) b))))

(define (unique-pairs n)
  (flatmap (lambda(i)
             (map (lambda(j)
                    (cons i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;(define (prime-sum-pairs n)
;  (map make-pair-sum
;       (filter prime-sum? (unique-pairs n))))