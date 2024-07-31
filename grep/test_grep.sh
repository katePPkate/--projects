#TEST 1
grep -e kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -e kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 1: SUCCESS"
else
    echo "Test 1: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 2
grep -e kkk -e lalala 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -e kkk -e lalala 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 2: SUCCESS"
else
    echo "Test 2: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 3
grep -f pattern.txt 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -f pattern.txt 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 3: SUCCESS"
else
    echo "Test 3: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 4
grep -v 123 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -v 123 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 4: SUCCESS"
else
    echo "Test 4: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 5
grep -i kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -i kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 5: SUCCESS"
else
    echo "Test 5: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 6
grep -c kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -c kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 6: SUCCESS"
else
    echo "Test 6: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 7
grep -l kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -l kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 7: SUCCESS"
else
    echo "Test 7: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 8
grep -n kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -n kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 8: SUCCESS"
else
    echo "Test 8: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 9
grep -h kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -h kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 9: SUCCESS"
else
    echo "Test 9: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 10
grep -s kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -s kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 10: SUCCESS"
else
    echo "Test 10: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 11
grep -o kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -o kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 11: SUCCESS"
else
    echo "Test 11: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 12
grep -iv kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -iv kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 12: SUCCESS"
else
    echo "Test 12: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 13
grep -in kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -in kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 13: SUCCESS"
else
    echo "Test 13: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 14
grep -ic kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ic kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 14: SUCCESS"
else
    echo "Test 14: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 15
grep -il kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -il kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 15: SUCCESS"
else
    echo "Test 15: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 16
grep -ih kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ih kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 16: SUCCESS"
else
    echo "Test 16: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 17
grep -is kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -is kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 17: SUCCESS"
else
    echo "Test 17: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 18
grep -f pattern.txt -i 1.txt 2.txt > grep.txt
./s21_grep -f pattern.txt -i 1.txt 2.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 18: SUCCESS"
else
    echo "Test 18: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 19
grep -io kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -io kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 19: SUCCESS"
else
    echo "Test 19: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 20
grep -vc kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -vc kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 20: SUCCESS"
else
    echo "Test 20: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 21
grep -vl kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -vl kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 21: SUCCESS"
else
    echo "Test 21: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 22
grep -vh kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -vh kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 22: SUCCESS"
else
    echo "Test 22: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 23
grep -vs kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -vs kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 23: SUCCESS"
else
    echo "Test 23: FAIL"
fi

rm grep.txt
rm s21grep.txt


#TEST 24
grep -vo kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -vo kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 24: SUCCESS"
else
    echo "Test 24: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 25
grep -cl kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -cl kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 25: SUCCESS"
else
    echo "Test 25: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 26
grep -cn kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -cn kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 26: SUCCESS"
else
    echo "Test 26: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 27
grep -ch kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ch kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 27: SUCCESS"
else
    echo "Test 27: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 28
grep -cs kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -cs kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 28: SUCCESS"
else
    echo "Test 28: FAIL"
fi

rm grep.txt
rm s21grep.txt


#TEST 29
grep -co kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -co kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 29: SUCCESS"
else
    echo "Test 29: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 30
grep -ln kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ln kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 30: SUCCESS"
else
    echo "Test 30: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 31
grep -lh kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -lh kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 31: SUCCESS"
else
    echo "Test 31: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 32
grep -ls kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ls kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 32: SUCCESS"
else
    echo "Test 32: FAIL"
fi

rm grep.txt
rm s21grep.txt


#TEST 33
grep -lo kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -lo kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 33: SUCCESS"
else
    echo "Test 33: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 34
grep -nh kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -nh kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 34: SUCCESS"
else
    echo "Test 34: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 35
grep -ns kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ns kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 35: SUCCESS"
else
    echo "Test 35: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 36
grep -no kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -no kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 36: SUCCESS"
else
    echo "Test 36: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 37
grep -hs kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -hs kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 37: SUCCESS"
else
    echo "Test 37: FAIL"
fi

rm grep.txt
rm s21grep.txt


#TEST 38
grep -ho kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -ho kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 38: SUCCESS"
else
    echo "Test 38: FAIL"
fi

rm grep.txt
rm s21grep.txt

#TEST 39
grep -so kkk 1.txt 2.txt 3.txt 4.txt > grep.txt
./s21_grep -so kkk 1.txt 2.txt 3.txt 4.txt > s21grep.txt
diff grep.txt s21grep.txt

if [ $? -eq 0 ]
then
    echo "Test 39: SUCCESS"
else
    echo "Test 39: FAIL"
fi

rm grep.txt
rm s21grep.txt
