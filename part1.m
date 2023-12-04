clear

% read file
inputFile = fileread("input.txt");
inputLines = splitlines(inputFile);

% so dumb 
inputLines = replace(inputLines, "   ", " ");
inputLines = replace(inputLines, "  ", " ");
inputLines = replace(inputLines, ": ", ":");

% get card indices
cards = split(inputLines, ":");
cards = split(cards(:, 1), " ");
cards = cards(:, 2);

% get lists
lists = split(inputLines, ":");
lists = split(lists(:, 2), " | ");

% get winning lists
winningLists = lists(:, 1);
winningLists = split(winningLists);
winningLists = str2double(winningLists)

% get player lists
playerLists = lists(:, 2);
playerLists = split(playerLists);
playerLists = str2double(playerLists)

% determine list count
listCount = size(playerLists);
listCount = listCount(1);

% score sum
scoreSum = 0;
for i = 1:listCount
    intersection = intersect(playerLists(i, :), winningLists(i, :));
    intersectionSize = size(intersection);
    score = 0;
    if intersectionSize(2) > 0
        score = 2^(intersectionSize(2)-1);
    end
    scoreSum = scoreSum + score;
    %disp(score)
end
disp(scoreSum)


%winningLists = split(winningLists)
%test = regexp("yolo 32  6", " ?\d+", "match")
%disp(listSize(1))
%test(:, 1) = split(test(:, 1), "Card")[1]



