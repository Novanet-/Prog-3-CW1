;;Checks if the graph is null, if so then returns an empty list, if map is null, return graph
;;else calculate the result of applying the map to the graph
(define graph-mapper
  (lambda (graph m)
    (cond ((null? graph) '())
          ((null? m) '())
          (else (calculate-graph graph m))
    )
  )
)

;;If there are no more edges left to applying the map to, then return the empty list
;;Otherwise, create a list of pairs, where each pair is an edge in the original graph, that has had all the
;;functions in the map applied to it
(define calculate-graph
  (lambda (graph m)
    (if (null? graph)
        '()
        (let ((edge (apply-map (car graph) m)))
          (if (null? edge)
              (calculate-graph (cdr graph) m)
              (cons edge (calculate-graph (cdr graph) m) )
          )
        )
        
    )
  )
)

;;If the given edge of the graph, or the map is empty, then return the empty list
;;Otherwise, apply the map functions in the map to the edge, replacing nodes according to the map
(define apply-map
  (lambda (edge m)
    (cond ((or (null? edge) (null? m)) '())
         ;; (else (replace-nodes edge (car m))))))
          (else (if (and (node-in-map? (sourcenode edge) m)
                         (node-in-map? (destnode edge) m))                 
                    (list (replace-node (sourcenode edge) m) (replace-node (destnode edge) m))
                    '()
                 )
           )
    )
  )
)

;;If the given node is the node of the domain of a map function, then replace the node with
;;the range of the map function, else check to see if the node is the domain of the
;;next map function
(define replace-node
  (lambda (node m)
  (cond ((null? m) '())
        ((eqv? node (sourcenode (car m))) (destnode (car m)))
         (else (replace-node node (cdr m)))
  )
  )
)

;;If the node is the domain of any of the map functions, then return true, else return false
(define node-in-map?
  (lambda (node m)
    (cond ((null? m) #f)
          ((eqv? node (sourcenode (car m))) #t)
          (else (node-in-map? node (cdr m)))
    )
  )
)

;;Gets the source node of an edge/the domain of a map functions
(define sourcenode
  (lambda (edge)
    (car edge)
  )
)
;;Gets the destination node of an edge/the range of a map function
(define destnode
  (lambda (edge)
    (if (list? (cdr edge))
        (car (cdr edge))
        (cdr edge)
    )
  )
)