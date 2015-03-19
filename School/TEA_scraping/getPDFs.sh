while read -r -a myArray
do 
	wget http://ritter.tea.state.tx.us/perfreport/src/2014/static/campus/c${myArray[0]}.pdf
done < CampusID.txt
