#lang racket
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond [(= trials-remaining 0)
           (/ trials-passed trials)]
          [(experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1))]
          [else
           (iter (- trials-remaining 1)
                 trials-passed)]))
  (iter trials 0))

(define (in-circle-test)
  (let ((x (random))
        (y (random)))
    (<= (+ (* x x) (* y y)) 1)))

(define (esitimate-pi trials)
  (exact->inexact (* 4 (monte-carlo trials in-circle-test))))

(esitimate-pi 1000)