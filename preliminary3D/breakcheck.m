function breakFlag = breakcheck(px,py,fixationPosition,checkWindowP)
breakFlag = px > fixationPosition(1)+checkWindowP || px < fixationPosition(1)-checkWindowP || py > fixationPosition(2)+checkWindowP || py < fixationPosition(2)-checkWindowP;
end