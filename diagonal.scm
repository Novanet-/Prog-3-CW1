#lang scheme

(define diagonal
  (lambda (m)
    (if (matrix? m)
      (calcDiagonal m 0)
       '())))

(define matrix?
  (lambda (m)
    (if (list-equal? (map length m))
    '()
    (error "Not a Rectangular Matrix"))))

(define calcDiagonal
  (lambda (m n)
    (if
     (or (null? m) (null? (car m)) (<= (length (car m)) n)) 
        '()
        (cons (list-ref (car m) n) (calcDiagonal (cdr m) (+ n 1))))))
     
(define list-equal?
  (lambda (l)
    (apply = l)))




