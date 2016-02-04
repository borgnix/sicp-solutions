#lang racket
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (set-front-ptr! v)
      (set! front-ptr v))
    (define (set-rear-ptr! v)
      (set! rear-ptr v))
    (define (dispatch m)
      (cond [(eq? m 'front) front-ptr]
            [(eq? m 'rear) rear-ptr]
            [(eq? m 'set-front) set-front-ptr!]
            [(eq? m 'set-rear) set-rear-ptr!]
            [else
             (error "BAD TYPE" m)]))
    dispatch))

(define (front-ptr queue)
  (queue 'front))

(define (rear-ptr queue)
  (queue 'rear))

(define (set-front-ptr! queue item)
  ((queue 'set-front) item))

(define (set-rear-ptr! queue item)
  ((queue 'set-rear) item))