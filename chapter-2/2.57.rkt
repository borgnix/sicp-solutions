#lang racket
(define (augend exp)
  (if (null? (cddr exp))
      0
      (cons '+ (cddr exp))))

(define (multiplicand exp)
  (if (null? (cddr exp))
      1
      (cons '* (cddr exp))))

