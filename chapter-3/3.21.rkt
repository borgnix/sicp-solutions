#lang racket
(require "queue.rkt")
(define (print-queue queue)
  (display "QUEUE:")
 (front-ptr queue))
(define q1 (make-queue))

(insert-queue! q1 'a)
(print-queue q1)
(insert-queue! q1 'b)
(print-queue q1)
(delete-queue! q1)
(print-queue q1)
(delete-queue! q1)
(print-queue q1)

;what ben saw is actually a pair containing front-ptr and rear-ptr, and the queue sequence is pointed by front-ptr.