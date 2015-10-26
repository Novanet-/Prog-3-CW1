(define diagonal
  )

(define matrix?
  (lambda (m)
    (list-equal? (map length m))))

(define list-equal?
  (lambda (l)
    (apply = l)))



