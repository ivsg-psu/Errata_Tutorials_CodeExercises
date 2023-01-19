function [passnumber] = task11()
% This function creates an ASCII code representation of a string of letters
% for students to "decode" and determine a password
id = 102098;
rng(id*14);
text = 'THE PASSWORD IS ';

passnumber = zeros(length(text), 1);

for i = 1:length(text)
    switch text(i)
        case 'A'
            passnumber(i) = 65;
        case 'B'
            passnumber(i) = 66;
        case 'C'
            passnumber(i) = 67;
        case 'D'
            passnumber(i) = 68;
        case 'E'
            passnumber(i) = 69;
        case 'F'
            passnumber(i) = 70;
        case 'G'
            passnumber(i) = 71;
        case 'H'
            passnumber(i) = 72;
        case 'I'
            passnumber(i) = 73;
        case 'J'
            passnumber(i) = 74;
        case 'K'
            passnumber(i) = 75;
        case 'L'
            passnumber(i) = 76;
        case 'M'
            passnumber(i) = 77;
        case 'N'
            passnumber(i) = 78;
        case 'O'
            passnumber(i) = 79;
        case 'P'
            passnumber(i) = 80;
        case 'Q'
            passnumber(i) = 81;
        case 'R'
            passnumber(i) = 82;
        case 'S'
            passnumber(i) = 83;
        case 'T'
            passnumber(i) = 84;
        case 'U'
            passnumber(i) = 85;
        case 'V'
            passnumber(i) = 86;
        case 'W'
            passnumber(i) = 87;
        case 'X'
            passnumber(i) = 88;
        case 'Y'
            passnumber(i) = 89;
        case 'Z'
            passnumber(i) = 90;
        case ' '
            passnumber(i) = 32;
    end
            
end

passwordLength = floor(rand()*5 + 5);

for j = 1:passwordLength
    passnumber = [passnumber; round(rand()*25 + 65)];
end
end

