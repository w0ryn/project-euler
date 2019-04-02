(defun isMultipleOfX (num x)
  (if (= (mod num x) 0)
      t
      nil))

(defun isMultOf3or5 (num)
  (if (or (isMultipleOfX num 3) (isMultipleOfX num 5))
      t
      nil))

(defun first1000mults()
  (loop for i upto 1000
	if (isMultOf3or5 i)
	   collect i))

(defun main()
  (princ (first1000mults)))

(main)
