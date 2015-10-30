(define increasing-average
  (lambda (list)
    (if (checkAverage list 0 (car list))
        #t
        #f)))
        
(define checkAverage
  (lambda (list n prevAvg)
    (if (calculate_average list n) < prevAVG)
    #f
    (checkAverage list (+ n 1))))
        
(define calculate-average
  (lambda (list n)
   (/ (apply + l) (length list))))