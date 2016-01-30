#lang racket
(require "2.69.rkt")
(require "2.68.rkt")

(define tree (generate-huffman-tree
              '((a 2) (Get 2) (Sha 3) (Wah 1) (boom 1) (job 2) (na 16) (yip 16))))

(encode '(Get a job
              Sha na na na na na na na na
              Get a job
              Sha na na na na na na na na
              Wah yip yip yip yip yip yip yip yip yip
              Sha boom)
        tree)

; all 83 bits.
; If using fixed-length code we need 3bits for each symbol, so at least 3 * 36 = 108 bits for the lyrics.