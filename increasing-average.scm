;;Checks if the argument given is an empty list, if so, returns an error message
;;saying that no error message can be calculated, otherwise, checks the average of
;;succesive prefixes of the list
(define increasing-average
  (lambda (lst)
    (if (null? lst)
     (error "No average")
     (let ([average (checkAverage lst 0 (car lst))])
     (if (checkAverage lst 0 (car lst))
        (cons (checkAverage lst 0 (car lst)) '())
        #f
     )
     )
    )
   )
)

;;If the average is less than the average of the previous prefixes, then the average
;;is decreasing and returns false, otherwise calcuates succesive averages until the
;;full length of the list has been averaged
(define checkAverage
  (lambda (lst n prevAvg)
    (let ((currAvg (calculate-average lst n)))
    (if (< currAvg prevAvg)
    #f
    (if (= n (- (length lst) 1))
      currAvg
     (checkAverage lst (+ n 1) currAvg)
     )
     )
     )
  )
)

;;Sums up the elements of the list up to a given end, and then divdes it by n to give
;;the average of thsoe elements
(define calculate-average
  (lambda (lst n)
   (/ (sum-numbers lst n 0) (+ n 1))
  )
)

;;Sums up a given number of elements of a list using an accumulator
(define sum-numbers
  (lambda (lst n acc)
    (if (> acc n)
        0
        (+ (list-ref lst acc) (sum-numbers lst n (+ acc 1)))
    )
  )
)
