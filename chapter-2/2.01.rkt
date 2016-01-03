#lang racket
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((sn (/ n g))
          (sd (/ n g)))
    (cond [(and (< sn 0) (< sd 0))
          (cons (- sn) (- sd))]
          [(and (> sn 0) (< sd 0))
          (cons (- sn) (- sd))]
          [else (cons sn sd)]))))

;This program can not run without procedure gcd