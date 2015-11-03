;;Checks if either set is empty, if so, then return the other set
;;If sets are equal, then jsut return the first set
;;Otherwise, compute the union of the sets
(define listset-union
  (lambda (set1 set2)
    (cond ((listset-null? set1) set2)
          ((listset-null? set2) set1)
          ((listset-equal? set1 set2) set1)
          (else
               (compute-union set1 set2)))))

;;Base case: If second set is null, return first set
;;If the current element from the second set is already in the first set, then move onto the next element without adding the
;;element to the union;
;;Otherwise, add the current element of the second set, to the first set, and compute the union with the first set
;;(and all unioned elements form the second set) with the rest of the second set
(define compute-union
  (lambda (set1 set2)
    (cond ((listset-null? set2) set1)
          ((member (listset-first set2) set1) (compute-union set1 (listset-rest set2)))
          (else (compute-union (listset-add (listset-first set2) set1) (listset-rest set2))))))

