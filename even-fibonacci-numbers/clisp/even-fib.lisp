; for my own reference, calculating the first n fibonacci terms
(defun fibonacci (n &optional (a 0) (b 1))
  (if (zerop n)
    nil
    (cons a (fibonacci (1- n) b (+ a b)))))

(defun fibUnder4mil (&optional (n (list 0)) (a 1) (b 1))
  (if (< (car (last n)) 4000000)
    (fibUnder4mil (append n (list a)) b (+ a b)); if we are under 4,000,000 continue to the next fibonacci term
    (butlast n))); if we have gone over 4,000,000 return the list excluding the final element

(defun getEvens (numbers)
  (loop for x in numbers
	if (= (mod x 2) 0) collect x))

(defun sumList (numbers)
  (if (null numbers) 0 
    (+ (car numbers) (sumList (cdr numbers)))))

(defun main ()
  (setq fib<4mil (fibUnder4mil))
  (setq evenfib<4mil (getEvens fib<4mil))
  (format t "~%List of all fibonacci terms less than 4,000,000: ~%~D~%" fib<4mil)
  (format t "~%List of all even fibonacci terms less than 4,000,000: ~%~D~%" evenfib<4mil)
  (format t "~%Sum of all even fibonacci terms less than 4,000,000: ~%~D~%" (sumList evenfib<4mil)))

(main)
