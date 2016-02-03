#lang racket
(put 'project 'complex lambda(x)
     (make-real (real-part x)))

(put 'project 'real lambda(x)
     (let ((rat (rationalize x 1/100)))
       (make-rational (numerator rat)
                      (denominator rat))))

(put 'project 'rational lambda(x)
     (make-integer (round (/ (numer x) (denom x)))))

(define (drop x)
  (let ((project (get 'project (type-tag x)))
        (equal? (get 'equal? (type-tag x)))
        (raise (get 'raise (type-tag x))))
    (if (and project (equal? x (raise (project x))))
        (drop (project x))
        x)))

(define (apply-generic op . args)
  (let ((type-tags (map (type-tag args))))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car args))
                    (a2 (cadr args)))
                (if (eq? type1 type2)
                    (error "No method for these types")
                    (if (type1-lower-than-type2? type1 type2)
                        (apply-generic op (raise-type1->type2 a1 a2) a2)
                        (apply-generic op a1 (raise-type1->type2 a2 a1)))))
              (error "No method for these types"
                     (list op type-tags)))))))
