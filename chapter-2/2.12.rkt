#lang racket
(require "2.07.rkt")

(provide (all-defined-out))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-center-width c w)))

(define (percent i)
  (let ((c (+ (lower-bound i) (width i))))
    (/ c (width i))))