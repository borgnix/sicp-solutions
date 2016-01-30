#lang racket
(provide encode)
(require "huffman_tree.rkt")
(require "2.67.rkt")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))


(define (elements-of-set? x set)
  (cond [(null? set)
         #f]
        [(eq? (car set) x)
         #t]
        [else
         (elements-of-set? x (cdr set))]))

(define (encode-symbol symbol tree)
  (cond [(not (elements-of-set? symbol (symbols tree)))
         (error "SYMBOL NOT EXISTING.")]
        [(leaf? tree)
         '()]
        [(elements-of-set? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree)))]
        [else
         (cons 1 (encode-symbol symbol (right-branch tree)))]))
        