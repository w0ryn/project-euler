; finds the sun-square difference for natural numbers 1 through (n)
; this is a brute-force approach which is upper-bounded by O(n) running time
(defun listGenerationApproach (n)
  (setq
    squareOfSum  (expt (apply #'+ (loop for i from 1 to n collecting i)) 2)
    sumOfSquares (apply #'+ (loop for i from 1 to n collecting (expt i 2))))
  (- squareOfSum sumOfSquares))

; returns the sum of the squares of natural numbers by using the summation expansion for
;   squares of natural numbers
(defun Sum_of_Squares (n)
  (/ (* n (1+ n) (1+ (* 2 n))) 6)); (n * (n + 1) * (2n + 1)) / 6

; returns the sum of natural numbers squared by squaring the summation expansion for 
;   natural numbers
(defun Square_of_Sum (n)
  (expt (/ (* n (1+ n)) 2) 2)); ((n * (n + 1)) / 2) ^ 2

; uses the constant time evaluations of the sum of squares and the square of sum to find
;   the sum-square difference of natural numbers 1 through (n) in O(1) running time.
(defun Sum-square_Difference (n)
  (- (Square_of_Sum n) (Sum_of_Squares n)))


; highlights the difference in effectiveness between the brute-force method and the summation
;   expansion method in solving this problem
(defun main (&optional (howMany? 100))
  (format t "~%~%Brute-force approach: ")
  (time (setq sumSquareDifference (listGenerationApproach howMany?)))
  (format t "~%~%Summation expansion approach: ")
  (time (setq sumSquareDifference (Sum-square_Difference howMany?)))
  (format t "~%~%The sum-square difference for natural numbers 1 through ~D is ~D" howMany? sumSquareDifference))

(main)
