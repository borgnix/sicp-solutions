#lang racket
(define (make-monitored f)
  (let ((counter 0))
    (lambda (input)
      (cond [(eq? input 'how-many-calls?) counter]
            [(eq? input 'reset-count)
             (begin (set! counter 0)
                    counter)]
            [else
             (begin (set! counter (+ counter 1))
                    (f input))]))))

;(define s (make-monitored sqrt))
;(s 100)
;10
;(s 'how-many-calls?)
;1
;(s 'reset-count)
;0
