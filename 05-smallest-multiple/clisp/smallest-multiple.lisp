; return whether t if (x) is evenly divisible by all integers 1 through (n)
(defun isDivisibleBy1toN (x n)
  (cond ((= n 1) t); base case: 1 evenly divides all x
	((= (mod x n) 0); if x is evenly divisible by n
	  (isDivisibleBy1toN x (1- n))))); check n-1
; return the smallest integer evenly divisible by integers 1 through (n) (brute force method)
(defun smallestMultiple (n)
  (do ((x 1 (1+ x)))
      ((isDivisibleBy1toN x n) x)))

; most practical solution: use the built-in (lcm) function (which accepts multiple integer arguments)
(defun builtInApproach (n)
       (apply #'lcm (loop for x from 1 to n collecting x)))

; for the purpose of the exercise, we'll build out the lcm function:

; implementation of the Euclidean greatest common divisor algorithm
;   identity :: gcd(x, 0) = x
; recurrence :: gcd(x, y) = gcd(y, x%y)
(defun gcd* (x y)
  (do ()
      ((zerop y) (abs x))
      (shiftf x y (mod x y))))

; implementation of the least common multiple equation (based on GCD)
;      equation :: lcm(x, y) = | x * y | / gcd(x,y)
; associativity :: lcm(x, y, z) = lcm( lcm(x, y) z)
;      identity :: lcm(x, 1) = x
(defun lcm* (&rest numbers)
  (reduce (lambda (x y)
	    (/ (abs (* x y)) (gcd* x y)))
	  numbers :initial-value 1))

; then we can use the built-out lcm in the same way as the built-in
(defun lcmFor1toN (n)
       (apply #'lcm* (loop for x from 1 to n collecting x)))

(defun main ()
  (setq howMany? 10)
  (time (setq num (lcmFor1toN howMany?)))
  (format t "~%~%The smallest number that can evenly be divided by whole numbers 1 through ~D is ~D" howMany? num))

(main)
