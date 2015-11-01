#lang scheme

;;Checks if the graph is null, if so then returns an empty list, if map is null, return graph
;;else calculate the result of applying the map to the graph
(define graph-mapper
  (lambda (graph m)
    (cond ((null? graph) '())
          ((null? m) graph)
          (else (calculate-graph graph m)))))

;;If there are no more edges left to applying the map to, then return the empty list
;;Otherwise, create a list of pairs, where each pair is an edge in the original graph, that has had all the
;;functions in the map applied to it
(define calculate-graph
  (lambda (graph m)
    (if (null? (cdr graph))
        '()
        (cons (apply-map (car graph) m) (calculate-graph (cdr graph) m)))))

;;If the given edge of the graph, or the map is empty, then return the empty list
;;Otherwise, apply the map functions in the map to the edge, replacing nodes according to the map
(define apply-map
  (lambda (edge m)
    (cond ((or (null? edge) (null? m)) '())
         ;; (else (replace-nodes edge (car m))))))
          (cons (replace-node sourcenode m) (replace-node destnode m)))))

;;For each node in an edge, if it's the source node in a map function, then replace it with the destination node in that function
;;(define replace-nodes
;;  (lambda (edge map)
;;    (let ((mapf (car map)))
;;    (if (eqv? (sourcenode mapf) (sourcenode edge))
;;        (if (eqv? (sourcenode mapf) (destnode edge))
;;            (cons (destnode mapf) (destnode mapf))
;;            (cons (destnode mapf) (destnode edge)))
;;        (if (eqv? (sourcenode mapf) (destnode edge))
;;            (cons (sourcenode edge) (destnode mapf))
;;            (cons (sourcenode edge) (destnode edge)))))))

(define replace-node
  (lambda node m)
  (cond ((null? m) node)
         (eqv? node (caar m) (cdar m))
         (else (replace-node (cdr m)))))

(define sourcenode
  (lambda (edge)
    (car edge)))

(define destnode
  (lambda (edge)
    (cdr edge)))
        
;;(load "graphs.scm")
    
        