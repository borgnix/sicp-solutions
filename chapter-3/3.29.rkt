#lang racket
(require "circuit.rkt")

(define (or-gate a1 a2 output)
  (let ((c (make-wire))
        (d (make-wire))
        (e (make-wire)))
    (inverter a1 c)
    (inverter a2 d)
    (and-gate a1 a2 e)
    (inverter e output)
    'ok))

;2 and-gate-delay and 1 inverter-delay