;;Checks if the given argument is a square matrix, if not, then retunr from the program, otherwise
;;calculate the diagonal of a matrix
(define diagonal
  (lambda (m)
      (calcDiagonal m 0)
  )
)

;;Calculates the diagonal of a matrix recursively, by taking the car of the first row, the
;;cdr of the second row, incrementing by 1 of the list-ref of the row element accessed
;;and then repeating this proccess until the end of the matrix has been reached
(define calcDiagonal
  (lambda (m n)
    (if
     (or (null? m) (null? (car m)) (<= (length (car m)) n)) 
        '()
        (cons (list-ref (car m) n) (calcDiagonal (cdr m) (+ n 1)))
    )
   )
)
