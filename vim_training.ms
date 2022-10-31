.nr PS 14z  \" document font size
.TL 
Vim commands
.AU 
.AI 
.IP
.B1
.BI "First day" \"bold font 
.B2

.IP \[bu] 2  
% : to move between start and end of () or {} or []
.IP \[bu]
cit : change in tage <>-----<> 
.IP \[bu]
dit : delete in tage <>-----<>
.IP \[bu]
ci< : change in <---->
.IP \[bu]
di< : delete in <----> 
.IP \[bu]
di{ : delete in curly braces {------}
.IP \[bu]
ci{ : change in curly braces {------}
.IP \[bu]
di" : delete in "----"
.IP \[bu]
ci" : change in "----"
.IP \[bu]
ci( : change in (----)
.IP \[bu]
di( : delete in  (----)
.IP \[bu]
cw : to change word 
.IP \[bu]
dw : to delete word 
.IP \[bu]
cc : to change all line 
.IP \[bu]
3cc : to change 3 lines 

.IP \[bu]   
$ : move to end of line 
.IP \[bu]
0 : move to start of line 
.IP \[bu]
:12 : move to line number 12 

.IP \[bu]   
yy : yank line 
.IP \[bu]
5p : to paste line five times

.IP \[bu]  
w : move to one word forward  
.IP \[bu]
b : move to one word backwards 
.IP \[bu]
e : move to the end of word

.IP \[bu]  
I : move to the start of line and insert 
.IP \[bu] 
i : start typing before cursor 
.IP \[bu] 
a : start typing after cursor 

.IP \[bu] 
dd : delete line 
.IP \[bu] 
dG : delete from cursor to end of file 
.IP \[bu] 
dgg : delete form cursor to start of file 
.IP \[bu] 
4dd : delete four line 

.IP \[bu] 
r then char : replace 
.IP \[bu] 
u : undo 
.IP \[bu] 
^r : redo 

.sp 2 \"space between line 
.AI 
.IP
.B1
.BI "Second day"
.B2

.IP \[bu]
:wq /home/omar/name of file : to creat vim file and save 
.IP \[bu]
q then char (char is name of macro : qd ) ------- q (to end macro)
.IP \[bu]
@ then char (name of macro ) : to start this macro 
.IP \[bu]
3@ then char : to do this macro 3 times 

.sp 2 \"space between line 
.AI 
.IP
.B1
.BI "Third day"
.B2

.IP \[bu] 
dj : delet line and lower line 
.IP \[bu]
dk : delet line and upper line 
.IP \[bu]
o : to creat a new line below current line 
.IP \[bu]
Shift + o : to creat a new line up current line 
.IP \[bu]
yw : yank one word 
.IP \[bu]
ctrl + backslach : open and close the terminal
.IP \[bu]
:Neotree : open file explorer 
.IP \[bu]
:Neotree toggle : close file explorer
.IP \[bu]
ctrl + h or l : to move between file explorer and vim page 
.IP \[bu]
/word : search for word 


.sp 2 \"space between line 
.AI 
.IP
.B1
.BI "Horizontal Speed" 
.BI ": The Same Line" 
.B2

.IP \[bu] 
fh : jump to h character 
.IP \[bu] 
f[ : jump to [ 
.IP \[bu] 
F[ : jump to [   (backwards)
.IP \[bu] 
th : move to h character 
.IP \[bu] 
t[ : move to [
.IP \[bu] 
T[ : move to [   (backwards)
.IP \[bu] 
Bad way >> fe fe fe fe fe : to jump to e character 
.IP \[bu] 
Right way >> fe and then ";" : to do The same result 
.IP \[bu] 
x : delete one character 
.IP \[bu] 
s : delete one character and move to insert mode
.IP \[bu] 
cw : delete one word and move to insert mode 
.IP \[bu] 
ci( : delete words between () and move to insert mode 
.IP \[bu] 
di( : delete words between ()
.IP \[bu] 
vf) : visual mode and jump to ) 
.IP \[bu] 
vt) : visual mode and move to ) 
.IP \[bu] 
vt)s : visual mode and move to ) and delete which is selected and move to insert mode 
.IP \[bu] 
vt)d : visual mode and move to ) and delete which is selected  
.IP \[bu] 
vF( : visual mode and jump to (
.IP \[bu] 
vT( : visual mode and move to (
.IP \[bu] 
vT(s : visual mode and move to ( and delete which is selected and move to insert mode 
.IP \[bu] 
vt(y : visual mode and move to ( and yank which is selected 
.IP \[bu] 
ct) : cut to last position before ) and move to insert mode 
.IP \[bu] 
cf) : cut to ) and move to insert mode 
.IP \[bu] 
cF( : cut to ( and move to insert mode 
.IP \[bu] 
shift + d : to delete the rest of line 
.IP \[bu] 
shift + c : to delete the rest of line and move to insert mode 
.IP \[bu] 
shift + s : to delete the entire line and move to insert mode 


.sp 2 \"space between line 
.AI 
.IP
.B1
.BI "Vertical Domination" 
.B2

.IP \[bu] 
12j : move down by 12 lines 
.IP \[bu] 
12k : move up by 12 lines 
.IP \[bu] 
{ : move up 
.IP \[bu] 
} : move down
.IP \[bu] 
ctrl + u : move half page up 
.IP \[bu] 
ctrl + d : move half page down 
.IP \[bu] 
vi{ : visual all characters in {}

.sp 2 \"space between line 
.AI 
.IP
.B1
.BI "File Movements" 
.B2


.IP \[bu] 
mj : mark the line by (j)
.IP \[bu] 
**'j** : move to the line that is marked by (j)
.IP \[bu] 
ctrl o and i : to  move between two last positions
.IP \[bu] 
ctrl + s : save current file 
.IP \[bu] 
ctrl + q : close vim (close all tabs)
.IP \[bu] 
:enew : creat new file 
.IP \[bu] 
:w name for a new file 
.IP \[bu] 
:alpha : open Dashboard 
.IP \[bu] 
shift + l and h : to move between tabs 
.IP \[bu] 
ctrl + Left : resize left  
.IP \[bu] 
ctrl + Right : resize Right
.IP \[bu] 
**'** + 0 : go to last file edited   
.IP \[bu] 
**'** + . : go to last change 
.IP \[bu] 
space + w : save 
.IP \[bu] 
space + q : quit 
.IP \[bu] 
space + o : open explorer files and move from vim page to explorer files 
.IP \[bu] 
space + e : close explorer files 
.IP \[bu] 
space + d : Dashboard 
.IP \[bu] 
space + / : Comment Line  
.IP \[bu] 
>b : Move tab to right 
.IP \[bu] 
<b : Move tab to left 
.IP \[bu] 
space + T : Close spacific tab
.IP \[bu] 
space  + c : Close current tab

