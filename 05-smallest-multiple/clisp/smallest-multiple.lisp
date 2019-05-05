; most practical solution: use the built-in (lcm) function (which accepts multiple integer arguments)
(defun builtInApproach (n)
       (apply #'lcm (loop for x from 1 to n collecting x)))

; for the purpose of the exercise, we'll build out the lcm function:

; implementation of the Euclidean greatest common divisor algorithm
(defun gcd* (x y)
  (do ()
      ((zerop y) (abs x))      ; identity :: gcd(x, 0) = x
      (shiftf x y (mod x y)))) ; recurrence :: gcd(x, y) = gcd(y, x%y)

; implementation of the least common multiple equation (based on GCD)
(defun lcm* (&rest numbers)
  (reduce (lambda (x y)                   ; associativity :: lcm(x, y, z) = lcm( lcm(x, y) z)
	    (/ (abs (* x y)) (gcd* x y))) ; equation :: lcm(x, y) = |x*y| / gcd(x,y)
	  numbers :initial-value 1))      ; identity :: lcm(x, 1) = x

; then we can use the built-out lcm in the same way as the built-in
(defun lcmFor1toN (n)
       (apply #'lcm* (loop for x from 1 to n collecting x)))

(defun main ()
  (setq howMany? 10)
  (time (setq num (lcmFor1toN howMany?)))
  (format t "~%~%The smallest number that can evenly be divided by whole numbers 1 through ~D is ~D" howMany? num))

(main)
