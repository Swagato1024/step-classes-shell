function style (text, colorCode) {
  return "\033[" + colorCode + "m" + text + "\033[0m";
}

function green(text) {
  return style(text, "32");  
}

function red(text) {
  return style(text, "31"); 
}

const yellow = function (text) {
  return style(text, "33"); 
}

const underline = function(text) {
  return  style(text, "4");
}


function print (headline){
  console.log(yellow((underline(headline))));
}




//-------------------------------------------------------------------------------------------------------------------------


const repeatSymbol = function (star, noOfTimes) {
  return star.repeat(noOfTimes);
}

const newline = "\n";
const space = " ";
const star = "*";
const hyphen = "-";

//------------------------------------------------------------------------------------------------------------------------







function areEqual(array1, array2) {
  const length1 = array1.length;
  const length2 = array2.length;

  if (length1 !== length2) {
    return false;
  }

  for(let index = 0 ; index < length1 ; index++) {
    if(array1[index] !== array2[index]) {
      return false;
    }
  }
  return true;
}

function assertArraysEqual (programOutput, expectedOutput, testTitle) {
  const newline = "\n";
  const expectedVsActual = newline + " Expected : " + green(expectedOutput) + newline + "  Actual : " + red(programOutput);
  const failedInfo = "❌ " + testTitle + expectedVsActual;  
  const passedInfo = "✅ " + testTitle;

  const result = areEqual(expectedOutput, programOutput) ? passedInfo : failedInfo;
  console.log(result); 
}

function assertEquals (programOutput, expectedOutput, testTitle) {
  const newline = "\n";
  const expectedVsActual = newline + " Expected : \n" + green(expectedOutput) + newline + "  Actual : \n" + red(programOutput);
  const failedInfo = "❌ " + testTitle + expectedVsActual;  
  const passedInfo = "✅ " + testTitle;

  const result = (expectedOutput === programOutput) ? passedInfo : failedInfo;
  console.log(result); 
}

exports.assertEquals = assertEquals;
exports.assertArraysEqual = assertArraysEqual;
exports.yellow = yellow ;
exports.underline = underline;




